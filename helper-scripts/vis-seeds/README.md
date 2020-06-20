# Vis Seeds

The vis seeds (and the plants that grow from these) in Thaumic Additions: Reconstructed don't have a separate texture
for each aspect. Instead the images that are colored based on the aspect are built up of two layers, one that is the
same regardless of the aspect, and one that is recolored based on the aspect and overlaid on the first. It uses a custom
renderer for this, but unfortunately we cannot use this renderer when using the crops in AgriCraft.

The `build` script in this folder takes the information from the list of aspects and the textures from the mod, and uses
this to generate separate textures for each of the seeds and plants.

To throw an extra wrench in things there is one aspect (caeles) that does not have a static color but instead cycles through
colors. This one has been special-cased and gets an animated texture.
