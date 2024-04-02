# Dissertation
  Coventry Uni Dissertation

IMPORTANT:

I have mangled the Dissertation MD file so the headings are correct.
Check what I have done.  I would advise doing a diff.


## NOTES for building with Pandoc.

I have made a couple of changes so everything builds nicely with pandoc.

  - Renamed "Citations for bib file.md" to Citations.bib
  - Added Template Directory with template stuff
  - Added a Disso_Render.md file with the Header and other stuff needed


## Instructions

  - Keep working in the Dissertation MD FILE.md   (Although I would rename it to remove spaces
    - If you do rename,  modify Disso_Render.md  so it has the correct thing in the includes block.
  - Build with ```make Disso_Render.pdf```
  - ...
  - Profit
