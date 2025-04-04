# Introduction

Within the cyber world, there is a constant battle between viruses and antivirus software. Due to computers evolving at an exponential rate, so are the techniques of virus development and mitigation. This paper aims to understand the extent to which the stock antivirus system Windows Defender is able to prevent malicious executables from being run on a stock Windows machine. With this data, conclusions will be drawn on how effective Windows Defender is when different forms of evasion are used.

This research will evaluate the effectiveness of different virus creation tools for Windows 10. The Windows 10 operating system will be chosen due to the market share in operating systems, with Windows holding a substantial percentage. "As of December 2020, over 76% of all computers worldwide were running some version of Windows" [@zaharia2024cyber]. Having such a large share in the market means that an attacker’s priority when trying to infect a machine is mainly aimed at a Windows machine; by evaluating the effectiveness of Windows Defender, we will be able to understand the possible future mitigations to be put in place so that all devices are protected from a multitude of potential viruses.

There are many types of viruses, and remote access trojan (RAT) will be used for this experiment. The RAT virus was chosen due to the severity and impact it can have on a user. Remote access aims to gain full access to the victim’s machine and can open up doors to more attacks. By understanding how these viruses are created and the techniques used to obfuscate code, avoiding AV will allow us to put in the necessary protection mechanisms to defeat malicious users.

As discussed above, as Windows holds a majority share in the computer market, there are a range of tools for creating effective viruses. The impact of these tools on AV detection is rapidly changing. With plenty of innovations from both attackers and defenders, it is not easy to produce long-lasting solutions.

Up-to-date sources indicate that "560,000 new pieces of malware are detected every day" [@jovanovic2023malware]. With this vast number of potentially 0-day viruses being created every day, there is no way that antivirus software can keep up and block all these threats before they infect multiple machines.

[@jovanovic2023malware] says that "Every minute, four companies fall victim to ransomware attacks" This relates nicely to [@samarati2017cyber] report on how much cybercrime cost the UK in 2016, "Although ransomware ranked last in terms of the number of organisations affected (388,858), it ranked first in terms of financial losses (£7,356,060,699)". These statistics show us that more resources need to be dedicated to researching the techniques that attackers use to produce malware. After understanding why Antivirus is evaded, we will then be able to mitigate the impact of readily available tools and protect our computers. The reason so many organisations were affected is due to evasion techniques such as obfuscation and cryptography. Encoding and changing the structure of the payload will bypass specific detection techniques, such as signature-based scanning and potentially heuristic-based scanning, depending on the severity of the obfuscation. Also, techniques such as polymorphic code will allow code to be changed every time the program is run, further evading Antivirus by constantly changing its signature.

Antivirus software is arguably one of the most critical processes on our computers, blocking internal and external threats and protecting our computers from malicious users. This project will be important to the blue and red teams within cybersecurity. With more excellent knowledge of how antivirus systems cope with different forms of evasion, it will ensure that new protections are put in place to secure devices further. The research will also benefit individual users with little knowledge of cyber threats. This is because demonstrating the different ways a virus can come will encourage users to be more cautious when opening a file from an unsigned source. Furthermore, antivirus developers will be able to use the research to locate the flaws in any existing products. If a particular technique is used to guarantee antivirus evasion, then developers will be able to rectify any mistakes.

<!-- Talk about what the project is and what the project is not -->

The project in question will focus on the detection of a virus and will not devle into how the virus got onto the machine. Doing so will enable the experiment to accurately measure results concerning detection rates.

## Aims and objectives:

  - 1) How well do off-the-shelf tools evade antivirus?
  - 2) What evasion techniques, if any can successfully evade antivirus?
  - 3) Is it feasible to handcraft payloads, as opposed to generation through tools.

<!-- Need to talk more about aims and objectives -->
Lastly the primary research question is: To what extent can Windows Defender detect malicious code where evasion techniques are used?


# Literature review:

## Computer viruses

There are many different types of computer viruses, but the one that will be researched in this paper is the RAT virus. [@The_Editors_of_Encyclopaedia_2022] Describes this as a type of malicious computer software, usually disguised within a legitimate or beneficial program. Once this software is installed on a user's computer, the RAT will allow the attacker remote access to the victim's computer. Remote access gives the attacker a very threatening position; with the ability to access all computer files, applications and data, the attacker has the opportunity to steal and sell your confidential data [@Bhardwaj_2022]. 
In this paper by [@robinson2017s], the capture of personal data was valued at US$60 for each internet user at the time (2012). Although outdated, this paper sets an example of how personal data can be sold for profit. This breach in personal data can have a snowball effect of implications on the user and even cause problems such as identity theft and financial loss. Moreover, when data is lost from a company due to virus-related incidents, this can cause reputation damage and, consequently, loss of revenue.

## Computer virus history

### ILOVEYOU Virus

One of the most significant computer viruses was the "ILOVEYOU" virus. The web article by [@Root_2022] explains that the computer virus would be received via email and appear to be a text document described as a "Love letter coming from me." However, most users didn't realise the file received was a VBS script that ran a program to corrupt documents on the hard drive and then replicate itself through the use of your address book and access to the email account. 
This virus certainly wasn't the first to abuse this exploit, but it was a pivotal moment for malware development, and the damages incurred are estimated at about $10 billion.

### Zeus Virus

 <!-- might have to find a different reference to this as its tryna sell av solution -->

[@Cynet_2024] Informs about how Zeus/Zbot was a malware package that used a client/server model (Trojan). The primary function of Zeus was to gain unauthorised access to financial systems by stealing credentials, banking information and financial data. Over the years, this virus infected over 3 million computers in the US, including those of NASA and the Bank of America. Zeus disguised itself as legitimate software and enabled the malware when it spotted the use of a banking site or financial transaction. 
Zeus was so successful in infecting machines that it used two common ways of injection: drive-by downloads and compromises. Drive-by downloads involved compromising legitimate websites and exploiting known browser and operating system vulnerabilities to download the Zeus malware when a user accessed the site.
Secondly, as Zeus grew, it gained the ability to infiltrate user accounts on social media and over email. With the compromised accounts Zeus would be able to create phishing messages that trick the users into downloading this malware.

## Lifecycle of a computer virus

[@alrawi2021circle] investigated the life cycle of a virus. Upon reading the paper, a framework is creates where the lifecycle can be broken down into five simple components.
1) The infection vector: This is how the malware attacks a system
2) The payload: This is the dropped malware code after exploitation
3) Persistence: This is how the malware installs on a system
4) Capabilities: The functions in the malware code
5) C&C infrastructure: How the malware communicates with the operator
Using these components we are able to break down how a virus is able to infect, execute, and replicate on machines. This framework allows us to assess how impactful a virus could potentially be.

## Protection mechanisms

### Signature based detection

To stand a chance at bypassing AV, we need to understand the complexities around its detection mechanisms. [@rohith2021comprehensive] breaks down the different detection types. Firstly, there is a signature analysis. This involves scanning the file for a specific signature that is found within a known virus; if the signature matches, then the file will be reported as suspicious. One major disadvantage of using a detection system like this is that it can only scan for signatures that are known viruses; a new 0-day virus will not be detected by signature-based detection.
Because of this, we have a heuristic detection system. With the help of probabilistic algorithms it will "scan the file structure with the compliance with the virus patterns are checked". As this technique uses a probablistic algorithm it will cause false positives from time to time, an example of this may be a file that injects code into another application's memory, such as a mod for a game. As these methods aren't foolproof there is multiple methods that antivirus can use to detect malware. 

### Behavioural analysis

Another popular type of detection mechanism is the behaviour-based method. Unlike signature-based detection, behavioural analysis is dynamic and, therefore, does not share the same shortcomings as signature-based detection. The author [@bazrafshan2013survey] breaks down how this detection method works. "Behavioural-based detection techniques observe the behaviour of a program to conclude whether it is malicious or not" This means that the AV will break down the core functions of the program and assess whether the functions and how the program executes to determine whether any suspicious activities such as editing registry keys or starting outgoing connections to an unrecognised address. Different strains of malware can all be classified under a single behavioural signature as they may utilise the same type of behaviour. It's important to note that because behavioural analysis is dynamic, it does not have the same restraints against 0-day viruses like signature-based systems. This strength allows behavioural detection techniques to quarantine suspicious programs where coding techniques like polymorphic coding are employed. Overall, this enables behavioural analysis to detect newer malware as viruses often share the same properties as one another. One disadvantage to using this detection method is for the possibility of a false positive. As some programs may share behaviours that can be found in viruses, there is the possibility that the program will be flagged as unwanted. An example of this could be a mod for a game downloaded off the internet. As the mods may interfere with the integrity of the game's memory, that might be flagged as suspicious and, therefore, a false positive.

### Heuristic Detection

In the paper by [@rohith2021comprehensive], Heuristics is defined as a set of rules applied to a program to determine if it contains a virus or not. Heuristic-based detection is described as utilizing machine learning and data mining techniques to learn a program's intentions. Heuristic-based systems are both static and dynamic, with static analysis comparing the possible behaviour of the decompiled code with that of a database. The dynamic analysis will run the program in an isolated environment to observe its operations. These two types of analysis allow the AV to assess the risks of the threat without exposing the user's device to a potentially harmful program. Like behavioural analysis, there is the disadvantage that there could be false positives. As [@rohith2021comprehensive] suggests, it is impossible to create an algorithm that can definitively distinguish between a virus and an uninfected program with 100% accuracy.

### Sandboxing 

The author [@andryani2023detect] explains that a sandbox provides an isolated environment used to execute suspicious binary interactions. A sandbox is a security component for ongoing projects, usually with the ultimate goal of mitigating flaws. It is often used to execute untested or untrusted projects or code. Within Antivirus, sandboxing is employed as a virtual machine where potentially harmful files are executed to monitor their actions. [@rohith2021comprehensive] Sandboxes allow programs to execute freely without the risk of damaging or impeding the security of the user's device.

Overall, these protection mechanisms all have strengths and weaknesses. For an antivirus system to be reliable and effective, all four of these techniques should be employed to provide the most accurate and effective detection. In modern-day antivirus systems, these techniques will be highly developed and accurate to ensure the best possible security. However, that doesn't mean that they're unevadable.

## Bypass methods

As I mentioned above, computer malware infects thousands of companies per day [@jovanovic2023malware]. "Every minute, four companies fall victim to ransomware attacks". In addition, with more research being poured into discovering the techniques that black hat hackers may use to create a backdoor into a machine, the better chance we have at developing prevention techniques that quarantine these unwanted programs. If we stop the effectiveness of computer viruses, this would enable a higher level of confidentiality and data integrity, saving companies compensation claims and loss of reputation.

As virus detection techniques have evolved over the years, so has the need to create tools that bypass these techniques. The author [@garba2019evaluating] says, "Malwares generated using tools such as Metasploit are easily detected nowadays due to the techniques used by antiviruses" As a direct reaction, tools have had to evolve to keep up with antivirus detection. In this section, I will discuss some popular techniques malicious users may use to bypass AV.

### Encryption

The author [@rad2012camouflage] defines encryption as the earliest and simplest method employed by malware programmers to achieve their goals. The first known encrypted virus appeared in 1987 and was named Cascade. Encryption can be achieved in many ways; a simple way a payload can be encrypted is through the reversible XOR function. Since this paper, more tools have been developed, such as msfvenom, which takes a payload and encrypts it using a specified algorithm.

### Obfuscation

"General code obfuscation techniques aim to confuse the understanding of the way in which a program functions. These can range from simple layout transformations to complicated changes in control and data flow" [@balakrishnan2005code]. When employed into bypassing antivirus, obfuscation can be used to hide the intentions of an executable as obfuscation transforms or changes the code. In turn, this changes the signature of a file, making antivirus software unable to detect the executable through signature-based detection. Like encryption, due to more detection mechanisms, obfuscation would have to be used in complement to another evasion technique to have a chance of being successful. Although bypassing one detection is a step in the right direction, it is not enough to evade AV on its own.

### Morphic coding 

Morphic coding techniques such as polymorphism and metamorphism aim to change their own code each time they run with polymorphism, adapting its appearance with simple techniques such as encryption, data appending or prepending. [@aliexploring] states that polymorphism allows objects or methods to operate in multiple forms and adapt to different conditions within a program's code. One problem identified by [@konstantinou2008metamorphic] is that polymorphic viruses eventually have to decrypt their constant body in memory in order to function; advanced detection techniques can wait for the virus to decrypt itself and then detect it reliably. On the other hand, Metamorphic viruses have the ability to transform their code after each run. Through the use of obfuscation techniques metamorphic viruses spawn hundreds of iterations of a virus with the same core functions. Some more advanced metamorphic viruses may also have the ability to alter their execution depending on whether they are in a sandboxed environment. This is later confirmed in [@andryani2023detect] paper, where they inform us that Malware dodge sandbox is another type of malware that can tell if it is in a sandbox or virtual machine.

### Off-The-Shelf Tools

There are tools out there, such as Veil, Avet, TheFatRat and PeCloak.py, that aim to quickly create an undetectable executable file that can infect a victim's device. Although these tools are quick and easy to use, the results generated from them are usually sub-par. This is due to AV developers being able to watch the development of the tools and patch any exploits that may have been found by the tool developers. Although as some of these tools allow you to highly customise your payload, this may open a window of opportunity in that AV may take a while to detect the malicious file. 

## Papers
### Paper 1

The author [@kaushik2022systematic] of ‘A systematic approach for evading antiviruses using malware obfuscation’. The paper is from 2022 and describes the process they go through to obfuscate a payload with Graffiti and Veil-Evasion. This research aims to identify methods that can be used to bypass the antivirus, while mainly focussing on tools such as Veil-Evasion and Graffiti. Similarly to the proposed project, the author starts trying to evade antivirus by using readily available tools such as Graffiti and Veil-Evasion. According to the results, Graffiti failed most of the time to avoid the antivirus and was not effective. However, through the use of Veil-Evasion and a .bat to .exe converter, they were able to produce a payload that gave remote root access to a Windows machine (bypassing Windows 10 Defender). This is a significant result as it demonstrates that even off-the-shelf tools can be used to bypass Windows 10 Defender. Reviewing this paper gives an insight into the techniques I will need to follow to generate the same results and the methodology I should follow.

The paper also goes into good depth on how the different tools behave and the outputs they produce. For example, Veil can output the obfuscated payload as a .py, .bat, or .exe file. This is important to understand as these tools may be relied upon to create payloads for my future experiments.  In conjunction with using Veil and Graffiti the author also uses “If-else Deletion” to understand which portion of the code is required for the payload to run as intended. They also utilise “Dead code insertion.” This allows the payload to be filled with code that won’t affect the execution of the payload but also differs from the signature of the genuine payload.

One limitation of this paper is the sample size. The author concludes that “We have shown effectively that we can easily make a malware undetectable utilising code obfuscation strategies”. Although these results have proved that creating an obfuscated payload can evade antivirus, I do not believe that there is enough evidence to back up this argument and that the scope is too limited to creating a singular working payload. The paper shows the results of only one payload where Veil-Evasion bypassed 13 out of 59 Antivirus systems. Due to viruses constantly evolving, Antivirus systems have had to keep up in a never-ending battle. There is no evidence to suggest that this method for creating a virus is replicable on a large scale. Replicability is the most crucial factor when it comes to creating a virus; the ability to create a virus that can infect hundreds to thousands of machines without waking up the antivirus present is the goal of virus developers. As discussed earlier, antivirus systems work using databases and probabilistic algorithms to determine whether a program is suspicious. The aim of this study is to try to demonstrate the ways that viruses can be produced with techniques that evade Windows Defender.

One strength of this paper is that the conclusion provides an optimal approach to how the research could’ve been finer. “The best system to dodge protector is to make your own obfuscate tools whether that be with a custom obfuscator or transforming them physically by hand.” What this highlights to us is that for virus creation to be effective in bypassing antivirus, tools need to be created where we can obfuscate a payload using polymorphic or metamorphic systems. This would entail creating a payload that can transform its code to ensure that signature-based systems won't detect our payloads. The author  [@aliexploring] also exhibits the uses of polymorphic code and displays some compelling strengths as to how it is helpful for programmers when coding in an OOP-style approach. The benefits of coding in polymorphic ways will allow the developer to develop code quickly, reuse of code and more flexibility in object-oriented programming paradigms. Under normal circumstances within virus development, code reuse is generally a poor approach. However, the circumstance changes when techniques like polymorphic and metamorphic systems are employed. This will allow the developer to create a basic virus template to which the program will follow. After each run, the appearance or structure of the program may change slightly, but the core processes and functions will stay the same, ensuring a working payload.

In conclusion, this paper has a strong connection with my proposal. The paper has some crucial methodology that is relevant to the approach that I intend to take. The overall results demonstrate that evasion of modern-day antivirus systems is possible through the use of readily available tools. The paper is also very clear on the steps that need to be taken to reach the same results, enabling other researchers to be able to conduct the experiment themselves.

### Paper 2

In contrast to the results of this work, [@aminu2020evaluating] found concluded that the best evasion tools were Avet and PeCloak.py. "Bypassed most of the selected antivirus by 83% and 67% respectively". These findings are super interesting to us as a later study by [@kaushik2022systematic] was able to bypass Windows 10 Defender with Veil. The development of the tools used could cause this change in results. [@aminu2020evaluating] aimed to evaluate the effectiveness of selected antivirus systems through the use of evasion tools such as Veil 3.0, PeCloak.py, Shellter, and a Fat Rat. These tests were conducted against a Windows platform. Although these results are older and occurred while testing different antivirus systems to [@kaushik2022systematic], the results are still relevant and need to be understood. Since Windows Defender and the tools used in this experiment have arguably advanced, this also relates to above, where the emphasis is demonstrated over the need for more research to be done over antivirus systems and their counterpart. With technology evolving at exponential rates, so are the tools and techniques that create unwanted programs and leave backdoors into our machines. 

Interestingly, the author talks about how Avet was able to evade so many of the antivirus systems. It seems the main reason for this is Avet's ability to avoid sandboxing and emulation. "Avet includes two tools, avet.exe and AV evasion technique to avoid sandboxing and emulation". This result opens up many opportunities to explore. If the technique still functions, this would allow more simplistic but effective payloads and Windows Defender would have to rely on more dated detection techniques such as signature-based detections. 

One of the strengths of this paper is that the author used a virtual environment VM to stage both the attacker and the victim machines and connected them together through a NAT setup. This allowed the author to freely create payloads and infect the Windows 10 machines without the consequence of infecting a real machine. The methodology and recording of results were also really clear in this experiment. The results clearly demonstrate the effectiveness of both the antivirus and the evasion tool used. With this data strong conclusions could be made as to what AV systems provide the most protection and what tools rain supreme in evading AV.

In conjunction with [@kalogranis2018antivirus], these authors also conclude that results could be more substantial if the use of hand-crafted payloads were employed. This would stop the signature-based detection system from flagging files that have come from readily available tools and slow down the speed at which the antivirus flags the file as suspicious. Although it is a farfetched idea to hand-create every virus, it also demonstrates how coding techniques such as polymorphic and metamorphic systems could be employed to create more devastating strains of computer virus. 

### Paper 3

[@barr2021survivalism] discusses a sophisticated evasion technique called Living-Off-The-Land (LotL). This evasion technique is one of the major evasion techniques used in many attacks. The premise behind this attack is to leverage binaries that are already present in the system to conduct the attack. This is an interesting technique as it potentially bypasses the need for the attacker to inject a suspicious program into the system. The conclusions of this paper highlight that almost every popular AV product tested had difficulties detecting malicious usage of LotL binaries. Later development included working with AV vendors and working to implement detection methods for this style of attack.

One reason why this paper is so significant is due to LotL creating unforeseeable challenges for the AV, as the technique uses present binaries on the Windows system; this may have the effect of tricking AV into trusting the process. By favouring LotL, malicious processes are hidden in plain sight and function behind the legitimacy of a Windows binary. This is significant as the use of LotL will make static analysis methods such as signature-based detection obsolete. Relying purely on dynamic-based detection will leave space to where viruses evade the unreliable detection algorithms. Although LotL-based viruses can be seen as brutal to detect they are also particular to the machine. For example, most systems are configured slightly differently from person to person. The issue is being able to create a reliable, comprehensive binary list that encompasses all the possible configurations is unforeseeable. With this issue, the developer would have to handpick the binaries for a chance of infecting a system.

The authors first analyse several databases of up to roughly 31,000,000 different malware samples. They found that they had an average prevalence of about 9.41% in LotL techniques. Also, when conducting the experiment, they used some of the top market-leading antivirus products, including Windows Defender. The experiment also makes use of Windows 10 machines that have been up-to-date with the latest patches. All these variables give an advantage to the antivirus softwares. However, this is not reflected in the initial results. Almost every popular AV product that was tested had difficulties detecting malicious usage of LotL binaries. The authors went one step further and worked with AV developers to disclose information on the attacks and the severity of LotL. Despite this, only a fraction of AV vendors have implemented a successful detection mechanism. Also, some vendors implemented detections for the specific payload that was disclosed but not for detecting the technique employed. One reason for vendors unsuccessfully implementing a countermeasure is due to the risk of generating false positives.

Like all research on virus/antivirus developers, both sides benefit from the findings. As the authors concluded, the findings of the paper helped AV developers in creating a new detection mechanism for LotL. On the other hand, weaknesses have been exposed in current versions of Windows, and antivirus companies don't have any protections in place, there will be a need for ongoing research on this topic so that AV can keep up with the evolving LotL techniques. Since this research [@liu2023survey] analysed the evolution of fileless attacks. Results found that the prevalence of fileless attacks has been increasing year by year, and with this, so has LotL. LotL is not solely a Windows-based problem and is a significant concern for Linux, too. They are challenging to attack due to the stealthy ways they abuse binaries and require special attention.

## Key Findings:

After reading and discussing these papers, I want to emphasize some key findings and patterns. Firstly, across the reviewed papers, a consistent pattern emerges; Malware developers employ evasion techniques such as obfuscation encryption to hide their payload from traditional detection methods such as signature-based systems. Also, as my papers span over a few years, there are contradictions in the findings of different authors. The contradictions exemplify the battle between virus and AV developers. Some techniques or tools that may have worked six months ago may now be obsolete, whereas tools that may have previously not worked could be the key to creating a working payload. Lastly, we have discussed the strengths and limitations of each detection mechanism, such as signature, behavioural and heuristic. Lastly the tools and current evasion techniques have been discussed.  
Some negative patterns emerged; authors understood the importance of handcrafted payloads and the implications they could have for AV detection. However, this assumption should have been reflected in their papers. Most experimentation consisted of payload generation through the usage of tools. Although this is very convenient for experimentation, it won't allow for the results to be fully reflective of real-life scenarios, where it is missing a key aspect in the ways in which payloads are crafted. Through my experiment, I will fill the gaps in research by developing my own payload through the use of Python.
Understanding this research enables me to start answering my research questions. Firstly, key characteristics of a virus was defined by [@alrawi2021circle] as having 5 simple components (The infection vector, the payload, persistence, capabilities, C&C infrastructure) Lastly, [@bazrafshan2013survey] defines how behavioural based mechanism use probabilistic algorithms to determine whether a programs behaviour is malicious. 

# Methodology

I will adopting an experimental methodology to answer, to what extent can Windows Defender detect malicious code where evasion techniques are used. To answer this question fully I have broken broken down the research questions into sub questions

  - 1) How well do off-the-shelf tools evade antivirus?
  - 2) What evasion techniques, if any can successfully evade antivirus?
  - 3) Is it feasible to handcraft payloads, as opposed to generation through tools.
 
The results section will be represented with quantitative data within tables so that it can easily be interpreted.

## Environment

In order to test the hypothesis, firstly an environment will need to be setup. The experimentation will be carried out within a lab and using virtual machines hosted on (VMware Workstation 16) with the target running Windows 10 to the latest patch, and the attacker running Kali Linux. The two machines will be connected through the same private NAT network device. Reasoning for this is to enable the two machines to freely communicate with one another using local IP addresses, ensuring that no other devices accidentally get infected with our payloads, and that there are no external variables unaccounted for. 
 
![Network configuration (Attacker/Victim)](NetworkConfig.png) 

Kali Linux comes with a wide range of pre-installed pen-testing applications and tools, due to the freedom that kali Linux enables, this will also allow creation of malicious payloads without the risk of the operating system deleting any crucial work. As discussed above, the purpose of this research is focussing on the effectiveness of Windows Defender when a malicious file is already present on the machine. Furthermore, the target will be infected by pythons http server command.  `python -m http.server`. Through the usage of this command I will be able to setup a temporary local webserver from the attackers current directory, that enables the target machine to download any payloads that are created. This will be further highlighted in the figure above.

![Web server configuration](WebserverUpload1.png) 

Using this configuration the attacker machine will be able to upload new iterations of any viruses created in a secure fashion. This also replicates how a virus may be downloaded onto a machine in real world scenarios. When downloading the payloads, antivirus will be turned off to allow testing to be conducted on whether the payload firstly works and connects back to the attacker machine, doing this will allow more accurate results to be concluded due to some payloads being outdated and unable to function as intended. After testing whether payloads are able to run without AV turned on, non-working payloads will be discarded and then AV will be turned on allowing it to detect any payloads that are left on the machine. 
If any payloads are left on the machine after the AV has been turned on then we will assume they will be run to further test the level to which they have evaded AV
Overall results will be recorded and noted on 4 different variables. Firstly, if the payload generated correctly. Secondly, if the payload connected successfully without AV turned on. Thirdly, the score generated by VirusTotal. And lastly, if the payload connects with Antivirus turned on.

## Tools

In this section I will discuss the tools and methods that will be employed to evaluate how well off-the-shelf tools evade antivirus. I have chosen a selection of well known and frequently updated tools for this section, this will hopefully give the best chance at evading antivirus. By using off-the-shelf tools we we be able to actively answer one of our research questions being "How well do off-the-shelf tools evade antivirus?" while also uncovering methods that can be used in hand crafted payloads to better stand a chance at evading AV.

### Msfvenom

Msfvenom is probably one of the most well known tools when it comes to generating payloads for platforms such as, Windows, Mac, and Linux machines. With many generic payloads within its database, msfvenom is easy to use and can generate payloads to very specific needs. With all previous experiments discussed above using msfvenom, it seems the best way to test the effectiveness of Windows Defender is to see how its developed over the years in combatting payloads from this off-the-shelf tool. Msfvenom will also be used in conjunction with some of the other tools discussed below, to create payloads where needed. Specifically a couple of different payload types will be generated, `.msi` and `.exe`.  The first iteration of payloads will consist of a simple reverse TCP shell payload to be encrypted with all 46 types of encryption available. After testing is done with the exe format, steps will be repeated using msi payloads in place. Lastly, testing will be conducted further using a templated exe, for this case regedit.exe was selected due to it being in all windows systems, and being a file that needs elevated privileges. 

<!-- Talk more about this once you have done some experimentation -->

## Veil 3.1

The reason Veil has been selected is due to the contradictry results that were generated over the span of a few years in the section above. Veil-Evasion is a famouse framework written in python. The framwork can to utilised to produce payloads that can sidestep most of the Avs [@kaushik2022systematic].

### AVET

Anti-Virus evasion tool (AVET) is a popular tool that is commonly used by pen-testers. Again this tool is accessible through GitHub and utilises the python language. AVET comes with many different payloads and evasion techniques, such as sandbox evasion which make it a great tool to conduct our experiment with. AVET payloads will be crafted by using msfvenom (this is built into the tool) and then using each sandbox evasion technique on the payloads. This will enable analysis on potentially working techniques, and gives the Antivirus a range of evasion techniques to defend against. After generating all 32 payloads, they will be deployed onto the windows machine and tested. Any positive results will be retested and analysed as to why they worked.

### Scarecrow

The last tool to be used is Scarecrow. This tool is fairly recent compared to the other tools discussed, and had its first commit on March 3rd, 2021. Scarecrow has an interesting certificate signing capability which allows the malicious file to be fake-signed by organisations like Microsoft. Scarecrow cannot work on its own and therefore we will be generating payloads from Msfvenom and saving them in a `.bin` format so that we can then utilise the encryption and evasion techniques of Scarecrow. Scarecrow will allow us to output a multitude of different file types, ranging from exe, to DLL files. Giving us the best chance of evading AV, and generating a consistent payload. For this experiment the reverse TCP shell payload will be used from msfvenom but this time saved as a `.bin` format so that Scarecrow can convert and add any encryption methods itself. For scarecrow I will be testing with control panel loaders or `.cpl` files, using a 2  different DLL evasion techniques such as KnownDLL and Disk evasion.

## Handcrafted payload

After experimenting with off-the-shelf tools, a handcrafted tool will be made and tested against windows AV. This will be done by the python language and using a Py to exe converter to generate and executable payload. The hand crafted payload will communicate to the victim machine via the usage of sockets over a reverse shell type connection, and return relevant information to the attacker machine. Like the payloads generated by the tools the handcrafted payload will be tested and evaluated in the same way. Depending on the outcome of the results, further testing and encryption may be utilised on the payload to ensure that it can defeat Windows Defender.

# Results

In this section, the results from the experiment will be discussed and visually represented to highlight any successes or failures in the experiment. One unfortunate failure to note is that Veil 3.1 was not up to the standard of the other tools, in such only one encryption method was availble for use (XOR), unforutnately this didnt work. Hence the decision was made to remove Veil 3.1 from the experiment.

## Msfvenom results

### EXE encoding

|                     Encoding | Compiled | AV OFF | AV ON | VirusTotal Score |
| ---------------------------: | -------- | ------ | ----- | ---------------- |
|                          RAW | True     | True   | False | 57               |
|                   cmd/base64 | True     | True   | False | 57               |
|                    cmd/brace | True     | True   | False | 58               |
|                     cmd/echo | True     | True   | False | 58               |
|               cmd/generic/sh | True     | True   | False | 58               |
|                      cmd/ifs | True     | True   | False | 58               |
|                     cmd/perl | True     | True   | False | 58               |
|        cmd/powershell_base64 | True     | True   | False | 58               |
|            cmd/printf_php_mq | True     | True   | False | 56               |
|                generic/eicar | True     | False  | False | 58               |
|                 generic/none | True     | True   | False | 58               |
|             mipsbe/byte_xori | True     | False  | False | 56               |
|               mispbe/longxor | True     | False  | False | 56               |
|             mipsle/byte_xori | True     | False  | False | 56               |
|               misple/longxor | True     | False  | False | 55               |
|                   php/base64 | True     | False  | False | 57               |
|                  ppc/longxor | True     | False  | False | 56               |
|              ppc/longxor_tag | True     | False  | False | 56               |
|                  ruby/base64 | True     | False  | False | 55               |
|            sparc/longxor_tag | True     | False  | False | 54               |
|                      x64/xor | True     | True   | False | 52               |
|              x64/xor_context | True     | False  | False | 56               |
|              x64/xor_dynamic | True     | True   | False | 57               |
|             x64/zutto_dekiru | True     | False  | False | 55               |
|                  x86/add_sub | True     | False  | False | 55               |
|              x86/alpha_mixed | True     | False  | False | 56               |
|              x86/alpha_upper | True     | False  | False | 53               |
| x86/avoid_underscore_tolower | True     | False  | False | 54               |
|       x86/avoid_utf8_tolower | True     | False  | False | 55               |
|                   x86/bloxor | True     | False  | False | 56               |
|             x86/bmp_polyglot | False    | False  | False | -                |
|          x86/call4_dword_xor | True     | False  | False | 57               |
|            x86/context_cpuid | True     | False  | False | 57               |
|             x86/context_stat | True     | False  | False | 57               |
|             x86/context_time | True     | False  | False | 56               |
|                x86/countdown | True     | True   | False | 54               |
|              x86/fnstenv_mov | True     | False  | False | 57               |
|        x86/jmp_call_additive | True     | False  | False | 56               |
|                 x86/nonalpha | True     | False  | False | 57               |
|                 x86/nonupper | False    | False  | False | -                |
|                  x86/opt_sub | True     | False  | False | 54               |
|                  x86/service | True     | False  | False | 58               |
|           x86/shikata_ga_nai | True     | False  | False | 49               |
|        x86/single_static_bit | True     | False  | False | 57               |
|            x86/unicode_mixed | True     | False  | False | 56               |
|            x86/unicode_upper | True     | False  | False | 55               |
|              x86/xor_dynamic | True     | False  | False | 56               |
|                 x86/xor_poly | True     | True   | False | 57               |
Table: Results of encoding on EXE payload \label{tab:exe}

The results produced in Table \ref{tab:exe} are as expected. The results show that the encoding methods used by msfvenom are ineffective and hiding the payload from Windows Defender, with all 46 encoding methods used, not a single one was able to evade AV. This could be for a multitude of reasons. However I believe that due of the popularity of Msfvenom, antivirus developers have had a close eye on any advancements and encoding methods that are employed, and therefore patch up systems before they can be exploited. When testing the different payloads, it was interesting to see that all iterations got picked up instantly by AV, most likely this was the signature based detection doing its job and matching the signatures of the overly used payloads and deleting them before they could be downloaded onto the system. Lastly, out of 72 different Antiviruses the lowest score received was 49 using x64/shikata_ga_nai. This is a very high score, but this was expected due to the popularity of the tool, and the abundance of tutuorials on the internet teaching indivuduals how to "hack" has caused the downfall on the effectiveness of this tool.

### MSI encoding

|                     Encoding | Compiled | AV OFF | AV ON | VirusTotal Score |
| ---------------------------: | -------- | ------ | ----- | ---------------- |
|                          RAW | True     | True   | False | 38               |
|                   cmd/base64 | True     | True   | False | 39               |
|                    cmd/brace | True     | True   | False | 39               |
|                     cmd/echo | True     | True   | False | 41               |
|               cmd/generic/sh | True     | True   | False | 41               |
|                      cmd/ifs | True     | True   | False | 40               |
|                     cmd/perl | True     | True   | False | 41               |
|        cmd/powershell_base64 | True     | True   | False | 39               |
|            cmd/printf_php_mq | True     | True   | False | 41               |
|                generic/eicar | True     | False  | False | 40               |
|                 generic/none | True     | True   | False | 41               |
|             mipsbe/byte_xori | True     | False  | False | 38               |
|               mispbe/longxor | False    | False  | False | -                |
|             mipsle/byte_xori | True     | False  | False | 42               |
|               misple/longxor | True     | False  | False | 42               |
|                   php/base64 | True     | False  | False | 44               |
|                  ppc/longxor | True     | False  | False | 39               |
|              ppc/longxor_tag | True     | False  | False | 42               |
|                  ruby/base64 | True     | False  | False | 42               |
|            sparc/longxor_tag | True     | False  | False | 43               |
|                      x64/xor | True     | False  | False | 37               |
|              x64/xor_context | True     | False  | False | 40               |
|              x64/xor_dynamic | True     | True   | False | 40               |
|             x64/zutto_dekiru | True     | False  | False | 44               |
|                  x86/add_sub | True     | False  | False | 39               |
|              x86/alpha_mixed | True     | True   | False | 42               |
|              x86/alpha_upper | True     | True   | False | 42               |
| x86/avoid_underscore_tolower | True     | False  | False | 39               |
|       x86/avoid_utf8_tolower | False    | False  | False | -                |
|                   x86/bloxor | True     | True   | False | 40               |
|             x86/bmp_polyglot | False    | False  | False | -                |
|          x86/call4_dword_xor | True     | True   | False | 42               |
|            x86/context_cpuid | True     | False  | False | 40               |
|             x86/context_stat | True     | False  | False | 43               |
|             x86/context_time | True     | False  | False | 42               |
|                x86/countdown | True     | True   | False | 40               |
|              x86/fnstenv_mov | True     | True   | False | 43               |
|        x86/jmp_call_additive | True     | True   | False | 41               |
|                 x86/nonalpha | False    | False  | False | -                |
|                 x86/nonupper | True     | False  | False | 41               |
|                  x86/opt_sub | True     | False  | False | 38               |
|                  x86/service | True     | False  | False | 37               |
|           x86/shikata_ga_nai | True     | True   | False | 41               |
|        x86/single_static_bit | True     | True   | False | 39               |
|            x86/unicode_mixed | True     | False  | False | 41               |
|            x86/unicode_upper | True     | False  | False | 42               |
|              x86/xor_dynamic | True     | True   | False | 40               |
|                 x86/xor_poly | True     | True   | False | 41               |
Table: Results of encoding on MSI payload \label{tab:msi}

The results in Table \ref{tab:msi} show that Windows defender, yet again was unable to be evaded by msfvenom. With all 46 encryption methods being used on the MSI file type, all got deleted as soon as the file was downloaded onto the machine. Again this is most likely the word of the signature based detection. With so many people potentially using this tool, many virus iterations would have been committed to the signatures database, preventing further use of any payload created. The results also demonstrate a dramatic decrease in detection rates for Antivirus products as a whole, with a 20% average decrease in detection rates due to the extension type being an MSI instead of EXE is alarming. Like suggested in [@kalogranis2018antivirus] work, originality is the key to success when generating a payload to defeat AV. with popular methods and extensions being highly monitored it is easier to fly under the radar with less obvious and unusual methods. The lowest score recorded was shared 37 between x86/service and x64/xor. Its also interesting to note that the RAW payload with no encoding scored lower than majority of encoders. Again this could be the result of antiviruses being over saturated with payloads generated from msfvenom and therefore have no trouble detecting the overly used payloads.

### Templated EXE encoding

|                     Encoding | Compiled | AV OFF | AV ON | VirusTotal Score |
| ---------------------------: | -------- | ------ | ----- | ---------------- |
|                          RAW | True     | True   | False | 57               |
|                   cmd/base64 | True     | True   | False | 57               |
|                    cmd/brace | True     | True   | False | 52               |
|                     cmd/echo | True     | True   | False | 55               |
|               cmd/generic/sh | True     | True   | False | 57               |
|                      cmd/ifs | True     | True   | False | 57               |
|                     cmd/perl | True     | True   | False | 57               |
|        cmd/powershell_base64 | True     | True   | False | 57               |
|            cmd/printf_php_mq | True     | True   | False | 56               |
|                generic/eicar | True     | False  | False | 34               |
|                 generic/none | True     | True   | False | 56               |
|             mipsbe/byte_xori | True     | False  | False | 56               |
|               mispbe/longxor | True     | True   | False | 57               |
|             mipsle/byte_xori | True     | False  | False | 56               |
|               misple/longxor | False    | False  | False | -                |
|                   php/base64 | True     | False  | False | 53               |
|                  ppc/longxor | True     | False  | False | 55               |
|              ppc/longxor_tag | True     | False  | False | 56               |
|                  ruby/base64 | True     | False  | False | 56               |
|            sparc/longxor_tag | True     | False  | False | 56               |
|                      x64/xor | True     | False  | False | 55               |
|              x64/xor_context | True     | True   | False | 56               |
|              x64/xor_dynamic | True     | True   | False | 57               |
|             x64/zutto_dekiru | True     | False  | False | 54               |
|                  x86/add_sub | True     | False  | False | 56               |
|              x86/alpha_mixed | True     | True   | False | 55               |
|              x86/alpha_upper | True     | True   | False | 49               |
| x86/avoid_underscore_tolower | True     | False  | False | 54               |
|       x86/avoid_utf8_tolower | False    | False  | False | -                |
|                   x86/bloxor | True     | True   | False | 52               |
|             x86/bmp_polyglot | False    | False  | False | -                |
|          x86/call4_dword_xor | True     | True   | False | 55               |
|            x86/context_cpuid | True     | False  | False | 57               |
|             x86/context_stat | True     | False  | False | 57               |
|             x86/context_time | True     | False  | False | 47               |
|                x86/countdown | True     | True   | False | 56               |
|              x86/fnstenv_mov | True     | True   | False | 56               |
|        x86/jmp_call_additive | True     | True   | False | 57               |
|                 x86/nonalpha | False    | False  | False | -                |
|                 x86/nonupper | True     | False  | False | 52               |
|                  x86/opt_sub | True     | False  | False | 55               |
|                  x86/service | True     | False  | False | 57               |
|           x86/shikata_ga_nai | True     | True   | False | 56               |
|        x86/single_static_bit | True     | True   | False | 57               |
|            x86/unicode_mixed | True     | False  | False | 56               |
|            x86/unicode_upper | True     | False  | False | 54               |
|              x86/xor_dynamic | True     | True   | False | 56               |
|                 x86/xor_poly | True     | True   | False | 56               |
Table: Results of encoding on Templated EXE payload \label{tab:tempexe}

The results in Table \ref{tab:tempexe} are very similar to that of Table \ref{tab:exe}. It seems that even when hiding the payload within another program antivirus still has no problem detecting the malicious code. Again once the payloads were loaded onto the victim machine, they were instantly picked up by AV and deleted, therefore windows defender effectively stopped all payloads. Although the exe used (regedit) is probably quite a popular choice when using a program as a template, it is interesting to see how efficiently antivirus picks up on the malicious code within a program and deletes it. Clearly if a payload is to be successful there needs to be something different that sets it out from the rest of detected iterations. 

<!-- Could deffo yap further about this if needed -->

### Overview of Msfvenom results

On the whole, msfvenom failed to create a single payload that evaded Windows Defender. Msfvenom is a very popular tool and therefore it could be expected that Antivirus developers like Microsoft would keep a close eye on it. Msfvenom is probably one of the most customisable payload generation tools available, and as expected, it is a backbone for the community. However although there are many options, its not foreseeable that msfvenom can generate a payload to evade Windows Defender by itself. Consequently, if a payload is to work, it would need to have some other form of evasion technique employed that is not commonly found in a well known tool such as Msfvenom.

## Avet results

|                      Encoding | Compiled | AV OFF | AV ON | VirusTotal Score |
| ----------------------------: | -------- | ------ | ----- | ---------------- |
|                           RAW | True     | True   | False | 24               |
|         check_fast_forwarding | True     | True   | False | 14               |
|         computation_fibonacci | True     | True   | False | 24               |
|   computation_timed_fibonacci | True     | True   | False | 24               |
|              evasion_by_sleep | True     | True   | False | 14               |
|         fopen_sandbox_evasion | True     | False  | False | 13               |
|                 get_bios_info | True     | True   | False | 14               |
|           get_computer_domain | True     | True   | False | 14               |
|                 get_cpu_cores | True     | True   | False | 24               |
|                  get_eventlog | True     | True   | False | 13               |
|              get_install_date | True     | True   | False | 13               |
|             get_num_processes | True     | True   | False | 13               |
|             get_registry_size | True     | False  | False | 13               |
|          get_standard_browser | True     | True   | False | 14               |
|                 get_tickcount | True     | True   | False | 14               |
|                       get_usb | True     | True   | False | 14               |
| gethostbyname_sandbox_evasion | False    | False  | False | -                |
|             has_background_wp | True     | True   | False | 13               |
|                    has_folder | True     | False  | False | 13               |
|             has_network_drive | True     | False  | False | 13               |
|              has_process_exit | False    | False  | False | -                |
|            has_public_desktop | True     | True   | True  | 13               |
|              has_revent_files | True     | False  | False | 11               |
|               has_recycle_bin | True     | True   | False | 14               |
|                  has_username | True     | False  | False | 13               |
|                    has_vm_mac | False    | False  | False | -                |
|                 has_vm_regkey | True     | False  | False | 13               |
|                  hide_console | True     | True   | False | 15               |
|           interaction_getchar | True     | True   | False | 14               |
|          interaction_ msg_box | True     | True   | False | 24               |
|      interaction_system_pause | True     | True   | False | 14               |
|           is_debugger_present | True     | True   | False | 24               |
|                 sleep_by_ping | True     | True   | False | 14               |
Table: Results of sandbox evasion with AVET \label{tab:avet}

### Overview of AVET results

The payload used for the results above was "avetenc_mtrprtrxor_revhttps_win64.exe".
The results shown in Table \ref{tab:avet} are very surprising. On the whole AVET did very well at hiding the file on the computer. With about 1/3 of the payloads remaining on the machine after Antivirus was turned on, because of the sandboxing protections that come with Avet this allowed the payloads to go undetectable until they were run. However this is where all but one of the payloads failed, with real-time protection doing a great job it was able to remove the payloads before they were able to connect back to the attacker machine. The one payload that was able to connect back to the attacker machine was using the 'has_public_desktop' evasion technique. This was a positive result but behavioural detection caught onto the payload when using malicious functions on the meterpreter shell, like screenshare. This may be due to the nature of the payload that was being used as to why this behavioural detection occued, like mentioned previously, behavioural detection will assess each processes actions and decide whether it is malicious or not. Different strains of malware can all be classified under a single behavioural signature as they may utilise the same type of behaviour [@bazrafshan2013survey]. As meterpreter shells are very well known it is very possible that the functions signature was picked up on and then shut down. 
The results were further reflected in the TotalAV score, with the lowest scoring payload only being detected by 11 Antivirus products, for reference this is 26 less than the best payload score in Msfvenom. The low detection rates highlight the importance of originality in payload generation. With less people aware of AVET, less payloads have been used by and detected by antivirus products, forcing them to use dynamic analysis techniques such as behavioural detection and heuristics to detect the payloads.

## Scarecrow results

|           File | Encoding | Compiled | AV OFF | AV ON | VirusTotal Score |
| -------------: | -------: | -------- | ------ | ----- | ---------------- |
|        Cmd.exe |      AES | True     | True   | False | 35               |
|    Outlook.exe |      AES | True     | True   | False | 35               |
|   Onedrive.exe |      AES | True     | True   | False | 36               |
|       Word.exe |      AES | True     | True   | False | 34               |
|      Excel.exe |      AES | True     | True   | False | 36               |
|    Onenote.exe |      AES | True     | True   | False | 34               |
| Powerpoint.exe |      AES | True     | True   | False | 35               |
Table: Results of Scarecrow AES evasion \label{tab:scar1}

|           File | Encoding | Compiled | AV OFF | AV ON | VirusTotal Score |
| -------------: | -------: | -------- | ------ | ----- | ---------------- |
|        Cmd.exe |    ELZMA | True     | True   | False | 33               |
|    Outlook.exe |    ELZMA | True     | True   | False | 33               |
|   Onedrive.exe |    ELZMA | True     | True   | False | 33               |
|       Word.exe |    ELZMA | True     | True   | False | 34               |
|      Excel.exe |    ELZMA | True     | True   | False | 34               |
|    Onenote.exe |    ELZMA | True     | True   | False | 34               |
| Powerpoint.exe |    ELZMA | True     | True   | False | 33               |
Table: Results of Scarecrow ELZMA evasion \label{tab:scar2}

The results in Table \ref{tab:scar1} and Table \ref{tab:scar2} very similar. With both using being signed by www.microsoft.com and generating very common Microsoft files. Although the payloads looked like genuine Microsoft files at first glance, they didnt make it past signature detection, being deleted almost instantly from the machine. With high VirusTotal scores both encoding techniques alone didnt provide sufficient evasion to get past AV. 

|            File | Encoding | Compiled | AV OFF | AV ON | VirusTotal Score |
| --------------: | -------: | -------- | ------ | ----- | ---------------- |
|    Datetime.cpl |      AES | True     | True   | True  | 17               |
|     Desktop.cpl |      AES | True     | True   | True  | 16               |
|      Irprop.cpl |      AES | True     | True   | True  | 16               |
| Netfirewall.cpl |      AES | True     | True   | True  | 16               |
|      Tablet.cpl |      AES | True     | True   | True  | 16               |
|      Winsec.cpl |      AES | True     | True   | True  | 18               |
Table: Results of Scarecrow evasion Disk \label{tab:scardisk}

The results in Table \ref{tab:scardisk} demonstrate the clear defeat in Windows defender, with all 6 payloads successfully defeating windows defender and connecting back to the attacker machine. From there full control was granted and any commands could be executed on the victim machine. With the VirusTotal scores also being very low it is clear to see that this type of evasion is not very well documented, let alone protected against. The payloads above were creating by using the flags `-encryptionmode AES -domain www.apple.com -obfu -Loader control -Evasion Disk` The main two flags to take note of are the Loader and Evasion methods employed. As mentioned above in Msfvenoms results, Windows defender performs significantly worse when defending against payloads in unfamiliar formats. This change in the payload type could be what tricked the AV into trusting the un-legitimate CPL file. Each payload above was tested 3 times to ensure the reliability of the results generated, all produced the same results each time.

|          File | Encoding | Compiled | AV OFF | AV ON | VirusTotal Score |
| ------------: | -------: | -------- | ------ | ----- | ---------------- |
| Appwizard.cpl |      AES | True     | True   | True  | 17               |
|  Datetime.cpl |      AES | True     | True   | True  | 15               |
|   Mimosys.cpl |      AES | True     | True   | True  | 16               |
|       Ncp.cpl |      AES | True     | True   | True  | 15               |
| Telephone.cpl |      AES | True     | True   | True  | 17               |
|    Winsec.cpl |      AES | True     | True   | True  | 17               |
Table: Results of Scarecrow evasion Known DLL \label{tab:scarDLL}

Further testing was done with scarecrow to look for any successful patterns in payload generation. Table \ref{tab:scarDLL} shows another successful evasion from all 6 payloads. Using similar flags to the previous iterations of payloads, the only change being `-Evasion Known DLL`. It seems that the flags used with small changes have the ability to create many working payloads. The results generated above were created using a very specific evasion and obfuscation techniques so we can be positive that there are more "winning" payloads to be discovered. 

### Overview of Scarecrow results

Overall Scarecrow was very successful at generating working payloads to evade Windows Defender. Using different payload types and DLL evasions seemed to be the key factor in enabling the payload to trick Windows Defender into believing the legitimacy of CPL files. With all 12 CPL files providing a reverse shell it is very apparent that scarecrow is an effective way at evading AV. 

## Custom Payload 

For the second part of the experiment, a payload was handcrafted using python and sockets to create a RAT. 

|       File | Encoding | Compiled | AV OFF | AV ON | VirusTotal Score |
| ---------: | -------: | -------- | ------ | ----- | ---------------- |
| client.exe |     None | True     | True   | True  | 4                |
Table: Results of custom payload \label{tab:custom}

The results of table \ref{tab:custom} are as expected, with the custom payload evading Windows Defender. The scores on VirusTotal are shocking with only four Antivirus products detecting malware, the results produced above clearly indicate that [@kalogranis2018antivirus] was right in the fact that handcrafted payloads will perform better than tool generated payloads. Furthermore with the payload having no encoding and still producing the lowest score yet it further demonstrates the effectiveness of a hand crafted payload. The payload had functions such as, taking pictures on the victims webcam and opening a port on the machine so that the attacker can download any files. As the payload has many functions similar to those in modern day viruses it is strange that behavioural detection techniques didnt pick it up as a virus, it further demonstrates the limitations of signature detection. As mentioned previously by [@rohith2021comprehensive], signature based detection is a static and therefore relies on being updated with signatures of known viruses, as the virus above was created by hand, it wouldnt allow the chance for static based detection mechanisms such as signature-based to detect such payloads. Lastly, As the payload used no evasion techniques it ponders the question to whether Windows Defender has sufficient protections against new strains of viruses. 

<!-- Im going to have to talk more about this -->

# Discussion

## Effectiveness of tool generated payloads

Overall, it was very hard to create working payloads with our tools. With producing over 140+ payloads for Msfvenom, and not finding a single payload that was able to evade Windows Defender. Contradictory to [@aminu2020evaluating] AVET proved ineffective at side-stepping Windows Defender and also failed to generate working payloads; with one temporary exception. AVET had low scores on VirusTotal due to its sandbox evasion techniques but with the ongoing battles between AV and virus developers the results from [@aminu2020evaluating] could not be reproduced with this tool. Lastly, the tool Scarecrow was very effective at defeating Windows Defender with roughly half the tested payloads working. The reason for the success of Scarecrow is likely due to new evasion techniques employed, that tools like Msfvenom and Avet dont have access to. The ability to self sign payloads and obfuscate malicious codes by cloning DLL properties is what made Scarecrow so effective in producing working payloads. The impact of the results above could be detrimental to the security of Windows systems, allowing attackers the ability to quickly deploy and manage RAT viruses on a victims machines. Once the RAT virus runs on the machine other functions and clones will be created, lessening the security of those who use the machine. To prevent this from happening protection mechanisms will need to be put in place to search for fake signing and DLL cloning. 

## Effectiveness of custom payloads

"With 560,000 new pieces of ransomware being detected each day" [@jovanovic2023malware], Windows Defender should be focussing on new ways to detect malware. Our study showed that Windows Defender was ineffective at detecting custom payloads whereas other antivirus products were able to detect the malicious functions. As this 0-Day payload was never seen before this indicates a problem in the dynamic analysis of Defenders protection mechanisms, improvements will need to be made to the behavioural analysis to monitor core functions of new programs and assess any malicious intentions.

## Detections Graph

Lastly here is a clear view on the detection rates for the different tools compared to our custom payload. The spike in msfvenom demonstrates the popularity of the tool and therefore mirrors the detections that would be associated with using it.

![Detection Rates for AV](Detections.png)

# Conclusion

In conclusion, the results of this study exemplify the effectiveness of the different off-the-shelf payload generation tools and their capabilities at evading Windows Defender. While all payloads generated by Msfvenom and AVET proved to be ineffective, payloads from Scarecrow exhibited its effectiveness and consistently sidestepped Windows Defender. Moreover, 0-Day payloads or handcrafted payloads easily evaded Windows Defender and 68/72 antivirus products, shedding light on potential flaws in the protection mechanisms currently employed by AV products. 
In regards to any research questions, I can answer that off-the-shelf tools are ineffective at evading antivirus products due to the close eye developers keep on any advancements the tools make, patching any new vulnerabilities as they arise. The only exception is when a new tool is released and uses unconventional methods to evade antivirus, such as self-signing and Living of Land (LoL) techniques to blend in with the machines environment. The techniques mentioned before can also answer the question of which evasion techniques can successfully evade antivirus. 
Lastly, the results discussed lead us to believe that it is feasible to handcraft payloads, as opposed to generation through tools. Results show that tools can be very unreliable and may not produce consistent results. On the other hand, custom payloads will allow freedom of functionality and provide a low detection rate. The time to handcraft a payload is most likely shorter than it would take to find a sustainable tool for payload generation. Lastly, behaviours such as sending commands from meterpreter shells will instantly get reported to behavioural analysis and kill the payload. The work conducted above will be interesting to AV developers looking to strengthen their protection mechanisms or pen-testers to broaden their understanding on the effectiveness of the default AV on windows machines.

To answer the research question, overall I agree that Windows Defender can detect malicious code where evasion techniques are used to about 90%. With many tools being detected instantly, the 10% where AV failed was due to new methods or custom payloads.
<!-- Further research, find out the key factors needed for scarecrow to be successful -->

# Further work
 The study above although having conclusive results does not properly project the actions an attacker may take in the real world, for example the payloads produced mainly came from one tool at a time. Better results may of been able to be achieved if tools were used in conjunction with one another. Stacking sandbox evasion techniques with LoL techniques may allow a better chance of evasion than generating payloads one tool at a time. For future work more research would need to be done into why LoL is so effective at evading Windows Defender, and what downfalls prevent it from performing like other successful tools.

# Project management

## Gannt Chart

Over the course of the project, I have updated the Gannt chart to clearly reflect any changes in progroess. Overall the timelines were fairly similar, but the Literature review and the experimentation took longer than expected due to having to find up to date literature and automating mundane tasks such as generating 100's of payloads.

![Updated Gannt Chart](betterGANNT.png)

## Supervision process

Overall the Supervision process was very informative and helpful. Each Week meetings would be setup where students under the same supervisor could go to ask questions and get feedback. Furthermore, there was also time for me to individually setup meetings where I could discuss more project specific questions with my supervisor. The supervision process encouraged me to chip away at my work each week and bring forth questions when needed.

# Legal and Ethical considerations:

## Legal

Throughout this project I will be researching and developing computer viruses, and therefore bare any responsibility over the programs I create and how they are used. Because legal considerations around Computer Misuse Act (1990) and Civil Liability Laws, all versions of computer virus that are created will be tested locally. This means that we wont address how viruses spread over the internet, but we will dive into how well AV detects them once on a "victims" computer. During this research no data will be lost or destroyed and no person(s) will be affected by my research. 

## Ethical

As my research explores the techniques and mindset that a malware developer may use there are some ethical implications. Firstly, any working code that bypasses AV will be concealed as to not encourage readers to use for malicious reasons. Secondly, I will practice responsible disclosure. In the case that my research leads to a security hole being uncovered, this will be reported to the relevant parties. Lastly, I will ensure that the intentions of my research are purely educational.

<!-- Gant chart 
will need to talk about supervision process
--> 



