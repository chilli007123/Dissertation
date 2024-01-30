To what extent can Windows Defender detect malicious code where evasion techniques are used?

Student: Charles Graham
Supervisor: Dr Daniel Goldsmith


# Project Topic:

*Overall good backgound to the topic, gives nice context*

Within the cyber world there is a constant battle between virus and antivirus software. Due to computers evolving at an exponential rate, so are the techniques of virus development and mitigation. 
I want to understand the extent to which the stock antivirus system Windows Defender is able to prevent malicious executables from being run on a stock windows machine. 
With this data I will be able to conclude how effective Windows Defender is when different forms of evasion are used.  

This research will focus on evaluating the effectivness of differnt virus creation tools for windows 10
The reason I have chosen to focus on this operating system is due to the market share in operating systems with Windows holding a substantial percentage. 
"As of December 2020, over 76% of all computers worldwide were running some version of windows" (Andra zaharia, 2024).
Having such a large share in the market means that an attacker’s priority when trying to infect a machine is mainly aimed at a windows machine, by evaluating the 
effectiveness of Windows defender we will be able to understand the possible future mitigations to be put in place so that all devices are protected from a multitude 
of potential viruses.


## Overview of solution:

There are seveal off the shelf tools avaialbe for generating virus, and evading detection by AV systems.
To help AV developers understand the implications of these tools, they need to be able to evaluate the impact on AV detection rates.

The project will be based on experementation, I will feed a windows computer different versions of a virus or exploit and record two variables. Firstly, 
did the antivirus pick up the virus and quarantine it. Secondly, if the virus run as intended with full functionality. 

The results of experementation will be used to create a report, discussing the current state of the art in AV detection and evasion.

These viruses will be created by using various readily available tools online and also by original python code create by myself. As different viruses will be given to the machine I expect that most will be detected 
but some will fly under the radar of the antivirus. Hence my results will be drawn as a percentage of viruses that were detected, and the ones that escaped detection 
will be discussed as to why they succeeded in not being detected. Additionally, certain evasion techniques may help avoid detecion, but also effect the execution of the virus (THIS NEEDS BETTER WORDS)
After drawing these results I’ll be able to suggest techniques that could be implemented to further protect machines, or if I’m unable to produce a virus that evaded Windows defender then ill discuss the potential reasons why it was detected.

## Audience and Motivation:

As discussed in section 1 above. (Put where revevant to get details from the topic section*, there are a range of tools that can be used to create effective viruses.
The impact of these tools on detection is a (fast moving BETTER WORD) eviornment.  With plenty of innovations from both atter and defender.

TODO:  Add a scection with some CITED research, discussing how many virus are creates,  how much money is lost, different techinques for detection vs exasion etc.  What you need to do here is sell why this is important.

Antivirus software is arguably one of the most important processes on our computers, blocking internal and external threats, it protects our computers from malicious 
users. My projects will be important to the blue and red teams within cybersecurity. With greater knowledge on how antivirus systems cope with different forms of 
evasion, will ensure that new protections are put in place to further secure devices. Also, Im positive that my research will also benefit individual users who have little
knowledge around cyber threats. Reasoning for this is because by demonstrating the different ways in which a virus can come it will encourage users to be more cautious when
opening a file from an unsigned source.   (Also mention real world users as AV developers understaing these can protect them)

## Project Plan:

  - Discuss overall stratey.  Experemental,  I would go for Agile like apporach,  So Task -> Plan -> test -> Plan next task based on this.
  - Gant chart.  Doesnt have to be super detailed at this point.  you can do Task (lit review, design , experemention, wriup) in weekly blocks. Make it sensible
  - As we go through projct revise gantt chat, add details. 
  - Also disucss risks or potental problems.  Mostly around complexty of evasion.  However, its not a bad project becuase it demos that these tools dont work off the shelf, so we are safe from script kiddies.
  - 
