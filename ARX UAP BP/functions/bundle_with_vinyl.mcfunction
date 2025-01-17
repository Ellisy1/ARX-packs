tag @p add self

clear @p arx:bundle_with_vinyl 0 1

scoreboard players random @p trait_random 0 13
give @p[tag=self, scores={trait_random=0}] minecraft:music_disc_11
give @p[tag=self, scores={trait_random=1}] minecraft:music_disc_13
give @p[tag=self, scores={trait_random=2}] minecraft:music_disc_5
give @p[tag=self, scores={trait_random=3}] minecraft:music_disc_blocks
give @p[tag=self, scores={trait_random=4}] minecraft:music_disc_cat
give @p[tag=self, scores={trait_random=5}] minecraft:music_disc_chirp
give @p[tag=self, scores={trait_random=6}] minecraft:music_disc_far
give @p[tag=self, scores={trait_random=7}] minecraft:music_disc_mall
give @p[tag=self, scores={trait_random=8}] minecraft:music_disc_mellohi
give @p[tag=self, scores={trait_random=9}] minecraft:music_disc_otherside
give @p[tag=self, scores={trait_random=10}] minecraft:music_disc_stal
give @p[tag=self, scores={trait_random=11}] minecraft:music_disc_strad
give @p[tag=self, scores={trait_random=12}] minecraft:music_disc_wait
give @p[tag=self, scores={trait_random=13}] minecraft:music_disc_ward

tag @p remove self