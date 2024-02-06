# Dissertation
Coventry Uni Dissertation


# Template

Some Docs are Here

https://github.com/Wandmalfarbe/pandoc-latex-template

# Building

You have two options.  Pure pandoc or docker pandoc.  (I will do git stuff later)

On Linux

  - Select the verion you want to use in the makefile
  - run Make <file>.pdf
  
On Windows:  You will need to break the command out. SOmeting like

```
pandoc example_report.md  --from markdown --template eisvogel --listings --citeproc -o example_report.pdf
```

or 

```
docker run --rm --volume "$(pwd)":/data --user $(id -u):$(id -g) pandoc/extra:latest-ubuntu example_report.md --template eisvogel --listings --citeproc -o Pandoc_output.pdf 
```


# Fixes I made:

 - Titlepage etc.
 - Fixed Bullet points
 - Broken Image
 - I have done one reference.  I shall leave the rest up to you


## Adding References

### Create Bibfile

  I created **references.bib** to hold your cites
    -  Find the relevant refernce in .bib format.
    -  If you are using refworks.  I will show you haw to do this.
    -  Google Schoalr is good, again I can demo
    
### Use References

  - Cite format is [@reference]]  where reference is wahtever your bib file says.
  
For example for GTD

Bib file is 

```
@misc{allen2018getting,
  title={Getting things done},
  author={Allen, David},
  year={2018},
  publisher={A system for organizing tasks and proj}
}
```

Which means the in text citation is 

[@allen2018getting]
  
  
