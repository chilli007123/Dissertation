--- 
title: To what extent can Windows Defender detect malicious code where evasion techniques are used?
author: Charles Graham
sid: 11111546
supervisor: Dan Goldsmith
date: 12/12/2024
ethics_number: xxxxxx

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


abstract: |
    This paper aims to evalulate the effectiveness of Windows defenders protection mechanisms where evasion techniques are used. We discusses the current protection mechanisms in place to detect malicious files, and also the evasion techniques used to bypass such protections.
    Through the usage of off-the-shelf tools and custom payloads, the experiment was successful in evading AV. Tools such as AVET and Msfvenom had little success but Scarecrow was able to defeat Defender through the use of self signing and Living of The Land techniques. The results highlighted gaps between public tools and 0-Day handcrafted payloads, confirming the severity that custom payloads could impose in the ongoing battle between Virus and Anti-virus developers. With over 560,000 new detections of malware each day, the need to understand the current level to which we are exposed to malicious viruses is crucial. 
    
dedication: |
    I would like to dedicate this Dissertation to:
    
    My family and friends for loving and supporting throughout Uni.
    
    My Supervisor/mentor, for their invaluable time and knowledge, inspiring me to do great work.
    
    

---


```{.include}
Dissertation_MD_FILE.md
```
