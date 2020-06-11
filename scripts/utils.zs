#priority 1000

/**
 * Rudimentary string hash.
 */
function hash(input as string) as string {
   var characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789-_:<{}[]\"' ";
   var hc = 0;
   for i in 0 to input.length {
      hc += 3023 * (i % 64);
      hc += 1439 * characters.indexOf(input[i]);
      hc %= 1000000000;
   }
   print(input ~ " " ~ hc);
   return hc as string;
}
