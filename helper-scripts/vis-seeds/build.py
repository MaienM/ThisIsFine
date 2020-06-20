#!/usr/bin/env python3

import math
import os
import os.path
import shutil

import yaml
from mako.template import Template
from wand.color import Color
from wand.image import Image


class ImageBuilder(object):
	""" Helper class to assemble an image out of two images, one of which is recolored first. """
	def __init__(self, base_path, overlay_path):
		self.base_path = base_path
		self.overlay_path = overlay_path

	def __enter__(self):
		self.base_image = Image(filename = self.base_path)
		self.overlay_image = Image(filename = self.overlay_path)
		return self

	def __exit__(self, *args):
		self.base_image.close()
		self.overlay_image.close()

	def build(self, color_input):
		image = self.base_image.clone()
		with Color(color_input) as color, self.overlay_image.clone() as overlay:
			overlay.color_matrix([[color.red, 0, 0], [0, color.green, 0], [0, 0, color.blue]])
			image.composite(overlay)
		return image


def preview(image, scale = 10, background = '#8B8B8B'):
	from wand.display import display
	with Image(width = image.width, height = image.height, background = background) as preview:
		preview.composite(image)
		preview.resize(preview.width * scale, preview.height * scale, filter = 'box')
		display(preview)


def save(image, path_template, name):
	path = os.path.join(OUTPUT_FOLDER, output_path.format(name))
	os.makedirs(os.path.dirname(path), exist_ok = True)
	image.save(filename = path)
	return path


# Each of the output images is made up of two parts: the base image (first entry) which is not recolored, and the
# aspect-specific overlay (second entry) which is recolored.
IMAGES = [
	[
		'textures/items/vis_seeds_0.png',
		'textures/items/vis_seeds_1.png',
		'thisisfine_thaumadditions/textures/items/{}_vis_seeds.png',
	],
	[
		'textures/blocks/vis_crop_30.png',
		'textures/blocks/vis_crop_31.png',
		'thisisfine_thaumadditions/textures/blocks/{}_vis_crop/3.png',
	],
	[
		'textures/blocks/vis_crop_40.png',
		'textures/blocks/vis_crop_41.png',
		'thisisfine_thaumadditions/textures/blocks/{}_vis_crop/4.png',
	],
	[
		'textures/blocks/vis_crop_50.png',
		'textures/blocks/vis_crop_51.png',
		'thisisfine_thaumadditions/textures/blocks/{}_vis_crop/5.png',
	],
]

OUTPUT_FOLDER = 'output'

with open('aspects.yml', 'r') as f:
	aspects = yaml.safe_load(f)
with open('animation.mcmeta', 'r') as f:
	animationMetaTemplate = Template(f.read())
with open('plant.json', 'r') as f:
	plantJSONTemplate = Template(f.read())

try:
	shutil.rmtree(OUTPUT_FOLDER)
except FileNotFoundError:
	pass

textureCount = 0
animationCount = 0
animationFrameCount = 0
for [base_path, overlay_path, output_path] in IMAGES:
	with ImageBuilder(base_path, overlay_path) as builder:
		for aspect in aspects:
			if not aspect['color']:
				continue
			with builder.build(aspect['color']) as image:
				save(image, output_path, aspect['name'])
			textureCount += 1

		# Caelus is special as it normally cycles through colors, so generate an animation to replicate this.
		ticksPerFrame = 1
		ticksPerCycle = 400 # 1000 / 20 = 50ms per tick, 20_000 / 50 = 400 ticks.
		ticksPerSection = ticksPerCycle / 3.0
		with Image(width = 1, height = 1) as image:
			image.sequence.clear()
			for i in range(0, ticksPerCycle, ticksPerFrame):
				idx = int(i / ticksPerSection)
				color = [1, 1, 1]
				color[idx] = 1 - (i % ticksPerSection) / ticksPerSection
				color[idx - 1] = 1 - color[idx]
				with builder.build(f'rgb({color[0] * 100}%, {color[1] * 100}%, {color[2] * 100}%)') as frame:
					image.sequence += frame.sequence
			image.concat(stacked = True)
			path = save(image, output_path, 'caeles')
			with open(f'{path}.mcmeta', 'w') as f:
				f.write(animationMetaTemplate.render(ticksPerFrame = ticksPerFrame))
			animationCount += 1
			animationFrameCount += len(image.sequence)
print(
	f'Created textures for {len(aspects)} aspects, resulting in {textureCount} static textures '
	f'and {animationCount} animated textures (with a total of {animationFrameCount} frames).'
)

os.makedirs(os.path.join(OUTPUT_FOLDER, 'mod_thaumadditions/plants'))
for aspect in aspects:
	with open(os.path.join(OUTPUT_FOLDER, f"mod_thaumadditions/plants/{aspect['name']}_vis_plant.json"), 'w') as f:
		f.write(plantJSONTemplate.render(**aspect))
print(f'Created {len(aspects)} agricraft plant configs.')

shutil.copy('textures/LICENSE', os.path.join(OUTPUT_FOLDER, 'thisisfine_thaumadditions'))
shutil.copy('textures/README.md', os.path.join(OUTPUT_FOLDER, 'thisisfine_thaumadditions'))
