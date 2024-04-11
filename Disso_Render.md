--- 
title: To what extent can Windows Defender detect malicious code where evasion techniques are used?
author: Charles Graham
sid: 11111546
supervisor: Dan Goldsmith
date: 11/04/2024
ethics_number: P172726

toc: true
lof: true
lot: true

book: true
disable-header-and-footer: false
titlepage: true
titlepage-logo: template/images/cov_uni_logo.png

top-level-division: chapter

classoption:
  - oneside

bibliography: Citations.bib
reference-section-title: References
citation-style: template/apa

header-left: Windows Defnder detection of Malware Evasion
header-right: \chaptermark


abstract: |
    This paper aims to evaluate the effectiveness of Windows Defender Protection mechanisms where evasion techniques are used. We discuss the current protection mechanisms in place to detect malicious files, as well as the evasion techniques used to bypass such protections. Through the usage of off-the-shelf tools and custom code, payloads were generated and placed onto an up-to-date Windows 10 machine and tested against Windows Defender. The experiment was successful in evading AV, tools such as AVET and Msfvenom had little success, but Scarecrow was able to defeat Defender through the use of self-signing and Living of The Land techniques. The results highlighted gaps between public tools and 0-Day handcrafted payloads, confirming the severity that custom payloads could impose in the ongoing battle between Virus and Anti-virus developers. With over 560,000 new malware detections each day, understanding the current level to which we are exposed to malicious viruses is crucial.
    
dedication: |
    I would like to dedicate this Dissertation to:
    
    In loving memory of my Grandad, Braian Graham and my dog Monty who sadly were lost while at University. 
    
    Would like to mention my biggest supportes, my parents, who's love and support pushed me through school and guided me to achieve my greatest work, and pick me up when I was down.
    
    My Supervisor Dan Goldsmith, for his invaluable time and knowledge. University wouldnt of been as fun and engaging without you.
    
    Lastly a special thanks to all the friends I met along the way.
    
    
    
    

---


```{.include}
Dissertation_MD_FILE.md
```
# References {.unnumbered}

:::{#refs}
:::



```{.include}
Appendix.md
```
