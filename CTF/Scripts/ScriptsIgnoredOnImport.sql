﻿
USE [master]
GO

/****** Object:  Database [CTF]    Script Date: 4/12/2016 8:07:37 PM ******/
CREATE DATABASE [CTF]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CTF', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\CTF.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CTF_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\CTF_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [CTF] SET COMPATIBILITY_LEVEL = 120
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CTF].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [CTF] SET ANSI_NULL_DEFAULT OFF
GO

ALTER DATABASE [CTF] SET ANSI_NULLS OFF
GO

ALTER DATABASE [CTF] SET ANSI_PADDING OFF
GO

ALTER DATABASE [CTF] SET ANSI_WARNINGS OFF
GO

ALTER DATABASE [CTF] SET ARITHABORT OFF
GO

ALTER DATABASE [CTF] SET AUTO_CLOSE OFF
GO

ALTER DATABASE [CTF] SET AUTO_SHRINK OFF
GO

ALTER DATABASE [CTF] SET AUTO_UPDATE_STATISTICS ON
GO

ALTER DATABASE [CTF] SET CURSOR_CLOSE_ON_COMMIT OFF
GO

ALTER DATABASE [CTF] SET CURSOR_DEFAULT  GLOBAL
GO

ALTER DATABASE [CTF] SET CONCAT_NULL_YIELDS_NULL OFF
GO

ALTER DATABASE [CTF] SET NUMERIC_ROUNDABORT OFF
GO

ALTER DATABASE [CTF] SET QUOTED_IDENTIFIER OFF
GO

ALTER DATABASE [CTF] SET RECURSIVE_TRIGGERS OFF
GO

ALTER DATABASE [CTF] SET  DISABLE_BROKER
GO

ALTER DATABASE [CTF] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO

ALTER DATABASE [CTF] SET DATE_CORRELATION_OPTIMIZATION OFF
GO

ALTER DATABASE [CTF] SET TRUSTWORTHY OFF
GO

ALTER DATABASE [CTF] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO

ALTER DATABASE [CTF] SET PARAMETERIZATION SIMPLE
GO

ALTER DATABASE [CTF] SET READ_COMMITTED_SNAPSHOT OFF
GO

ALTER DATABASE [CTF] SET HONOR_BROKER_PRIORITY OFF
GO

ALTER DATABASE [CTF] SET RECOVERY SIMPLE
GO

ALTER DATABASE [CTF] SET  MULTI_USER
GO

ALTER DATABASE [CTF] SET PAGE_VERIFY CHECKSUM
GO

ALTER DATABASE [CTF] SET DB_CHAINING OFF
GO

ALTER DATABASE [CTF] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF )
GO

ALTER DATABASE [CTF] SET TARGET_RECOVERY_TIME = 0 SECONDS
GO

ALTER DATABASE [CTF] SET DELAYED_DURABILITY = DISABLED
GO

USE [CTF]
GO

/****** Object:  Table [dbo].[Category]    Script Date: 4/12/2016 8:07:37 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[Challenge]    Script Date: 4/12/2016 8:07:37 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[Game]    Script Date: 4/12/2016 8:07:37 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[Solved]    Script Date: 4/12/2016 8:07:37 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/****** Object:  Table [dbo].[User]    Script Date: 4/12/2016 8:07:37 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

USE [master]
GO

ALTER DATABASE [CTF] SET  READ_WRITE
GO

USE [CTF]
GO

INSERT INTO [dbo].[User] ([User_UserName], [User_Password], [User_FirstName], [User_LastName], [User_Email], [User_AccountType]) VALUES ('admin','admin','Admin','Admin','admin@test.com','admin')
GO

INSERT INTO [dbo].[User] ([User_UserName], [User_Password], [User_FirstName], [User_LastName], [User_Email], [User_AccountType]) VALUES ('user','user','User','User','user@test.com','user')
GO

INSERT [dbo].[Game] ([Game_Name]) VALUES ('Mitre 2012 CTF Game')
GO

INSERT [dbo].[Game] ([Game_Name]) VALUES ('Mitre 2013 CTF Game')
GO

INSERT [dbo].[Game] ([Game_Name]) VALUES ('Mitre 2014 CTF Game')
GO

INSERT [dbo].[Category] ([Game_ID], [Category_Name]) VALUES (1, 'web')
GO

INSERT [dbo].[Category] ([Game_ID], [Category_Name]) VALUES (1, 'grabbag')
GO

INSERT [dbo].[Category] ([Game_ID], [Category_Name]) VALUES (1, 'forensics')
GO

INSERT [dbo].[Category] ([Game_ID], [Category_Name]) VALUES (1, 'networking')
GO

INSERT [dbo].[Category] ([Game_ID], [Category_Name]) VALUES (1, 'crypto')
GO

INSERT [dbo].[Category] ([Game_ID], [Category_Name]) VALUES (2, 'binary')
GO

INSERT [dbo].[Category] ([Game_ID], [Category_Name]) VALUES (2, 'crypto')
GO

INSERT [dbo].[Category] ([Game_ID], [Category_Name]) VALUES (2, 'forensics')
GO

INSERT [dbo].[Category] ([Game_ID], [Category_Name]) VALUES (2, 'grabbag')
GO

INSERT [dbo].[Category] ([Game_ID], [Category_Name]) VALUES (2, 'networking')
GO

INSERT [dbo].[Category] ([Game_ID], [Category_Name]) VALUES (2, 'web')
GO

INSERT [dbo].[Category] ([Game_ID], [Category_Name]) VALUES (3, 'web')
GO

INSERT [dbo].[Category] ([Game_ID], [Category_Name]) VALUES (3, 'binary')
GO

INSERT [dbo].[Category] ([Game_ID], [Category_Name]) VALUES (3, 'forensics')
GO

INSERT [dbo].[Category] ([Game_ID], [Category_Name]) VALUES (3, 'grabbag')
GO

INSERT [dbo].[Category] ([Game_ID], [Category_Name]) VALUES (3, 'crypto')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (1,'None Shall Pass',100,'MCA-B281FAEE','', 'You have been asked to perform a penetration test on a web site that was a prototype and is now being used in production. The customer, a puggle breeder, suspects that the user authentication needs more locking down, but knows little else.  You have been given nothing but a web URL. Visit the [server](http://$htaccess) to see where the user logs in. You should be able to break in and view the flag. Please, think of the puggles.')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (1,'A Personal Voyage',200,'MCA-DCE4D899','', 'Join Carl for a journey through space and time on this latest episode of [COSMOS](http://$cosmos).')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (1,'Is anyone out there?',300,'MCA-A9C758E9','', 'MySpace is feeling a bit left out after everyone moved their social circles to Facebook (see what I did there?). After a series of privacy problems at Facebook, MySpace has seen an opportunity to win their users back with some great new features. We caught them testing a new [chat service](http://$nodejs:3000) but it doesn''t seem to be much better than any of their other web properties. At least you can''t change the background...oh the humanity.')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (1,'Travelling Through the Cosmos',400,'MCA-DCE4D899','', 'Scientists have determined the Great A''Tuin''s gender at long last, unfortunately they put it inside the [Discworld Planetary Information System](http://$turtles) and then had a rather unfortunate meeting with Death. Sadly, the late scientists were pretty bad at web sites and budget cuts had meant that they had to make their own information system. Even worse, though they were smart they were, as so many scientists are, a little mad (and really bad at web design, if we hadn''t mentioned it). We honestly have no idea what they were even trying to do with their system. Maybe you''ll have better luck than we did.    - The Management')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (1,'Making the grade',500,'MCA-D2242B07','', 'It looks like there''s a vulnerability in the [student directory](http://$haystick) system. You''ve been dying for that new Macbook Pro with Retina display and need some fast cash so a few other students have paid you to change their AP Calculus grades. This can only be done through an admin account.')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (2,'Binary, Binary Everywhere and not a knot in site',100,'MCA-10D44DF2','', 'Time to start [adding](http://$static_file_server/gbb-abb864b2337d4308a765db53b13dcf11/file.txt).      MD5: ab9a4fd2e46ab46492fa787e03696c3e')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (2,'Old Guy Quotes',200,'MCA-39090A5E','', 'These aren''t the [files](http://$static_file_server/gba-c345af8a4089431abf90532b9bd851f2/file.zip) you''re looking for. *waves hand*      MD5: fa88ecd7736f3d71cc836b4b7fef6a3f')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (2,'Sam''s Revenge',300,'MCA-D51CD2A3','', 'We believe Sam has been spying on one of his friends, unfortunately all we were able to get as far as evidence  was a pcap [capture](http://$static_file_server/gbc-88acf1ca7abb4f27972b0658d9fe191a/capture.pcap) and an archive of his home [directory](http://$static_file_server/gbc-88acf1ca7abb4f27972b0658d9fe191a/archive.7z). Unfortunately, the archive is password protected. You need to get at the information in this archive and find out if it contains enough evidence to prosecute Sam.       Archive MD5: f78d10d21ecff8a9addf08c4d02b085fCapture MD5: b84be2c7b1294ce2dfa4a1e044087256')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (2,'The Esoteric Challenge',400,'MCA-4D6C2753','', '[Neoplasticism](http://$static_file_server/gbe-88a4b38b72ec4ee5abdab0ab50d2edb2/esoteric.png) in a CTF? Wat? Better ask a Librarian!      MD5: cb5eb41f7f282edb5216a0abdd2806d7')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (2,'Ankh-Morkpork: City Limits',500,'MCA-1A94A9C2','', 'Captain Carrot welcomes you to the Great Wahoonie! We have a special problem for you, if you''d follow us down to the old UU, there''s a [small problem](http://$static_file_server/gbg-fca5db8e3ba946c2a0e6e98b2fbf6bc3/program.exe) we''d like you to take care of.      MD5: 088d894b5e2848fda9b35d2e7c207f66')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (3,'Everybody''s Quacking Up',100,'MCA-570F5B8A','', 'It seems like something''s not quite [ducky](http://$static_file_server/fb-c7802d54508f4678a8752455845de7c0/duck.jpg) YEEEEEAAAHHHH!      MD5: 360cea7fc271233838c88d423c85b7f3')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (3,'(No Subject)',200,'MCA-1ACCEBAB','', 'Hey Jon,      Here is the [MITRE logo](http://$static_file_server/fa-4b202ad68fce4d82b19a597df8cd5842/MITRE.png) we would like to youusefor the capture-the-flag event.      MITRE Public Relations      MD5: 8be24dc74455ac7fd78d56bc4cd667fd')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (3,'Enron',300,'MCA-40B3E9F8','', 'Our network administrators have informed us of some unusual activity on the network to and from our [web server](http://$django/). I guess it looks like files have been downloaded and uploaded to the server from outside the network. We are concerned that an attacker may have downloaded our wiki and altered it in some way. If you find anything in the code, you need to figure out what it does. We can''t have our corporate secrets falling into the wrong hands!')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (3,'MITRE Cyber Academy',400,'MCA-067BBD6F','', 'Joe produced a [screen cast](http://$static_file_server/fe-b09ebcf01ca6460da2cabac350d92fa4/video.flv) showing how to log into the MITRE Cyber Academy from a Windows machine. Unfortunately, before he was able to upload it to our server he dropped his computer and the hard drive died. Luckily we were able to recover most of the data but the video seems to be corrupted. We really don''t want to redo this video so if it is recoverable that''d be great.      MD5: 298ff68ca0cedfe86dbd52c6e0d0bf52')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (3,'TV on the Fritz',500,'MCA-00E438E8','', 'It looks like our favourite show isn''t coming in... or is [it](http://$static_file_server/fg-1db66fc00f4b473c95079b0167627886/image.bmp)?      MD5: a484c47b067c0d6ae34cbf67014918fc')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (4,'Confused Highway Engineers',100,'MCA-20DFF3A1','', 'So, it’s bad enough when we let those highway engineers work on our roads. We get gridlock, accidents, and all kinds of overlong red lights. Now, they let them onto our network! This (link) is the kind of [traffic](http://$static_file_server/na-7269e30b3ce1434c97c2254d201ebef9/challenge.pcap) we get. Can you flag down some help for them?      MD5: 66dac3855e269ad512d9070f1f892cc7')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (4,'Huck FIN',200,'MCA-9D8B1E24','', 'I done found myself [this awful old pile of bits](http://$static_file_server/nb-dc65bd97552846bd9aa2c1dbc18404d6/challenge.pcap) and I just don’t know what to do with none of them. Perhaps you could find a body to help me with this and we could set down for a good ol'' time. What do you say about that?      MD5: f1f506285956ff742e1f7371d8188e91')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (4,'Down the Rabbit Hole',300,'MCA-8B9B37E3','', 'We recently intercepted some traffic between the Matrix and the real world. It is our belief that the messages may contain access codes to the Zion mainframe. These codes are vital to our success in eliminating the human resistance. Here is the [conversation](http://$static_file_server/nc-3810c6011c6f4e3e91e817e9319ca40c/challenge.pcap).      MD5: 35646fba3cf34319d2d125fd3b8a7e6f')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (4,'Agent 007',400,'MCA-FCA7DE76','', 'Congratulations, you have successfully infultrated MI6 as a double agent. Your next mission, which you will accept whether you like it or not, is to steal Agent 007''s latest mission plans. Now that you have access to MI6 you have access to their intranet system. Download the [client login program](http://$server) and get in anyway you can.')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (4,'Dr. Lanning''s Last Words',500,'MCA-DE5ED7DE','', 'Detective Spooner, Dr. Lanning was found outside of his office after a rapid deceleration caused by the pavement outside. We do not believe this was a suicide, unfortunately he is in no state to tell us and all of the security cameras in his office seem to be broken. Luckily he left us a service running at $server that is listening on the port of the current year. We tried talking to it but our guys are at a loss.')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (5,'All Your Base',100,'MCA-98DA37CC','', 'We found a leak hinting that someone is making a Nintendo 64 port of the popular video game "Zero Wing". Among the leaked information was [this file](http://$static_file_server/ca-2a223af624354249ac69bb8019c5f490/leak) that could not be opened. See what you can figure out.      MD5: 40716445f4aaca87bd4e401ca7635bf6')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (5,'Alexander Kemurdjian',200,'MCA-39090A5E','', 'The Russian lunar rover, Lunokhod 1, was mysteriously reactivated after many years of innactivity. It has started transmitting data but Russia has lost the keys for decrypting it. They have enlisted our help in reversing their encryption by giving us the program used to encrypt it. Here is the [encryption program](http://$static_file_server/cc-21a8ba3d5f514842ac2a2f8c73a864fe/encryptor) and the [data](http://$static_file_server/cc-21a8ba3d5f514842ac2a2f8c73a864fe/flag.encrypted). Good luck.      Data MD5: b1c0b02fa4569bb4c046165c8a26d8feProgram MD5: b34b5f2ced72cf46648b57e7a97e3d85')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (5,'While You Were Gone',300,'MCA-65C97F8E','', 'Mrs. Ross called. She said something about Congress and a new standard. I know you were talking about making a new emblem for the country. She even sent [this package.](http://$static_file_server/cb-4cd58a5b16644c9cae3a3f6b8483e6c7/flag.bmp.encrypted) It looks off to me, like there''s something tucked inside. Give it a look when you get back, alright?      MD5: 3d4357e6c78e57f9184c6b8a67b27588')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (5,'Danger Zone',400,'MCA-4E1CC7B5','', 'The KGB has been sending encrypted [transmissions](http://$dangerzone/flag.encrypted) to their agent Kenny Loggins. In order to bring him in we need to show a judge what they are sending him. Luckily for us they have a server located atthat responds to all requests by encrypting the data sent to it. We have also found that they host the source [code](http://$dangerzone/encryptor.c) for their encryption mechanism on the same server.')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (5,'Pool on the roof',500,'MCA-5C8AEC67','', 'Prove yourself, Crash, in this latest phase of the challenge. You''ve only got a little time to show Burn. Here''s the next [target](http://$pool) that the ref''s have picked out.')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (6,'Jarhead',200,'None','', '“Knock, knock.”  “Who’s there?”  very long pause...  "Java"')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (6,'Era of Fantastic Colonies',200,'None','', 'You just downloaded the hit new real time strategy game, `Era of Fantastic Colonies.'' It''s now giving you trouble, asking for a CD key. Surely you purchased it, so that shouldn''t be a problem. Can you get around the obnoxious DRM?')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (6,'K-535 Yuriy Dolgorukiy',300,'None','', 'We''ve intercepted a submarine transmission from the Soviets. Only one authorization code disables the nuclear strike. Anything else and well... let''s just say we''re evacuating the entire eastern seaboard.')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (7,'Das Milkshake',100,'None','', 'Caeser''s milkshake brings all the Legionnaires to the yard...')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (7,'Le Chiffre Indechiffrable',200,'None','', 'Dear Yvonne, I have sent this to you because I fear that our government is tracking me. Vive la Revolution!')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (7,'Unbreakable',300,'None','', 'Scientist announces unbreakable encryption! The cryptographic community is bewildered! In a press release, the scientist states that he can prove that his cryptographic method is theoretically sound.')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (7,'German Intercepts',400,'None','', 'The year is 1914. America is entrenched in World War One, and you''ve managed to get your hands on an intercepted message from the Germans. It''s been heavily encrypted, but as America''s finest cryptographer of the era, you feel up to the challenge. You know this cipher is the one the French call Ubchi, and that the same keyword has been applied twice. You don''t know what the keyword it, however it shouldn''t be any longer than 15 characters.')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (7,'Modern Cryptography Standards',500,'None','', 'The year is 1972, and as an official of the US government it''s come to your attention that a new standard for classified information is needed in this modern day and age. In the past, cryptography has worked well, no ciphers currently exist that would be suitable for this task, however a new cipher has just been proposed by IBM and it''s up to you to try to crack their message. You know that they used a weak keyword consisting of 4 pairs of 2 letters each (e.g. ''AeAeAeAe'') as well as a weak encryption method, the electronic codebook. Since IBM''s cipher relies on a certain number of rounds, you also know that they could be using anywhere from 10 to 50 rounds. Everyone''s counting on you to give an answer on whether or not this cipher is a good fit for the government. Good Luck.')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (8,'Magnets, How They Work?!',100,'None','', 'Yo dog, we heard you like magnets')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (8,'Bread Crumbs Galore!',200,'None','', 'It''s a very Grimm situation here, with these scattered file remnants and whatnot. Help a Hansel out?')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (8,'Mountie Bounty',300,'None','', 'Dudley Do-Right seems to have locked down his system by disabling non-graphical logins. See what you can do to help him eh?')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (8,'I''m a Hacker!',300,'None','', 'Nuhuhuh! You didn''t say the magic word! Nuhuhuh! Nuhuhuh!')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (8,'All Mah Bits Are Gone!',500,'None','', 'Some hippy stole all mah bits! It''s not a bit if there aren''t no ones! And what''s with this here colorful picture. Back in my day, they didn''t have no colorful bits. Just green... Can you help Old Man Jenkins find his bits? He said he had something for you if you did - a relic of the old war, when he was a standard bearer.')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (9,'Zippee ki-yay',100,'None','', 'McClane and Zeus need your help on figuring out this riddle so they can see the instructions to disarm the bomb. See what you can do, and fast.')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (9,'Ringputer',200,'None','', 'We found Dilbert''s ring computer. Now, all you have to do is figure out how to read the darn thing.')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (9,'Trivia Challenge 3000!',300,'MCA-ED0C7012','', 'Welcome to the Sci-Fi portion of our game. In this challenge, you will have to match captains with their vessels from the show Star Trek. Oh wait! It appears as though we''ve lost one of the pictures of the captains! Maybe you can help us out?')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (9,'Corporate Language',500,'None','', 'You recently learned that Duckpond Industries was developing a secret language with which to create their next big product. After a bit of dumpster diving, you''ve recovered what you believe is the latest spec. A crafty bit of social engineering has provided you with a program which you believe contains a prototype of their flagship product. Can you figure it out?')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (9,'Wireless Haxxoring',1000,'None','', 'It''s 1997 and your friend''s neighbor is an electrical engineer working with the IEEE to implement a new standard for wireless encryption. As a result, your friend has been having trouble reading his secret messages.  He wants your help. What are friends for?')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (10,'Chicken Little',100,'None','', 'Q managed to extract this data from Silva''s laptop right before it took over the network. Since Q now has bigger problems, he was hoping you could help him out in figuring out what it means.')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (10,'Winter is Coming',200,'None','', 'We found an SD card with this packet capture on it tied to the leg of a crow. Apparently it contains the key to defeating the white walkers. Help get the key to the Night''s Watch... before it''s too late.')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (10,'Plot Lines',300,'None','', 'While Captain Jack Sparrow is off galavanting about with his jar of dirt, there is still treasure to be discovered in the Caribbean. See if you can figure out the riddles to find the greatest treasure of them all, and remember: X marks the spot.')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (10,'Cypsela 2013',400,'None','', '"Thank you for installing Cypsela 2013. Before you can play this award-winning plant evolution simulator, please make sure you enter in the username, password and CD key given on your box and have an active Internet connection." You''ve had enough of this DRM crap. Your buddy has provided a packet cap of his game when he connected, along with his  credentials. Maybe you can get back at those money-grubbing megacorps in  your own little way.')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (10,'Gateway Administration',500,'None','', 'You''ve been given the awesome responsibility of running a gateway node between two large networks. Everything flows through this node. Naturally, you''ve set up a packet caputuring tool. Here''s today''s traffic. See if there''s anything juicy?')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (11,'Truth in Fandom',100,'MCA-57412B01','', 'One of your friends, a hardcore Star Wars fan, told you to check out his site. He said he''s got the scoop on the new movie. Maybe you can find some truth in his website after all.')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (11,'Why So Serious?',200,'MCA-D0369CF1','', 'Bruce is trying to see what Gotham Times readers think about Batman; however, he''s a little embarrassed about reading fan fiction about himself, so he doesn''t want to register and pay to read the full articles. The Joker is plotting something big, so Bruce is a little busy with his night job. He''s hired you as temp help. See what you can do.')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (11,'Fast and Furious',300,'None','', 'Bob has been making a new admin system for the site that has now gone live. We managed to get this capture while he was developing.')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (11,'Sometimes Snack',400,'None','', 'The new messaging system jon has been working on has just been pushed up to Github. Although it is an early copy, at least some of the features are there...')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (12,'Capere clavem',50,'None','', 'Hey, look! "Latin!"')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (12,'This isn''t Dominos...',100,'None','', 'All we wanted was "a pizza".')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (12,'Underwater Basket Weaving',200,'None','', 'Who absolutely loves underwater basket weaving? YOU DO! Unfortunately, the last underwater basket weaving class ever is about to take place, but you didn''t sign up in time. But there is a waiting list.        If you can find that last key on the website, then surely you can get into the class and become a world master of the aquatic art. What are you waiting for? "GO GET THAT KEY".')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (12,'Stop. Zoom in. Enhance that!',300,'None','', 'The other night we caught two individuals who we believe to be spies on our CCTV cameras. During their interaction, one of the spies was writing what is suspected to be the password to their organization''s secure communications line.        When they realized our camera was there, they attempted to destroy it. They succeeded. However, we were able to recover some of the footage of the entire incident, along with a few frames of when they were getting away.         We know they dropped the code somewhere and we''ve narrowed our search of the key to one frame, but we can''t seem to find it. Do you think you can "assist us"?')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (12,'Achy Breaky Heart',400,'None','', 'Great. Your significant other is really really mad at you and has decided to take all of your documents and migrate them to their server. Even your work documents! Now an emergency at work has occured and your boss has called to get the failsafe key to lock the lab down.        Everyone''s counting on you to "get that key"!')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (13,'Flip! It''s an iPhone!',100,'None','', 'Moss: Flip! It’s an iPhone! There are flipping iPhones overflowing from the crane machine!         [Moss looks through pockets]         Moss: Ugh, I’m out of coin.         [Kicks crane door that reads “PLEASE DO NOT REACH INTO THE PLAYING AREA”]         [Enter Jen]         Jen: Moss?! Moss? What am I gonna do?         [Moss appears inside of crane, surrounded by toys]         Jen: What are you…? How did you get in there?         Moss: Through the hole.         Jen: Why?         Moss: There’s an iPhone, Jen! An actual iPhone!         Jen: I need your password. I need the password for the translation program.         Moss: Help me get the iPhone first. I can’t move my arms.         Jen: No.         Moss: I need to get it through the shoot. Someone else will take it if you don’t.         Jen: I’m sure they’re not giving it away. An engineer must have dropped it.         Moss: No. No. No, it’s a prize! It’s a prize! You’ve gotta help!         Jen: I don’t have time.         Moss: But it’s an iPhone, Jen. I may be able to get an iPhone without giving any money to Apple! I’ll be living the dream!         Jen: What’s the password? What’s the password?!         [Moss tries to get phone with mouth]         [Jen bangs on glass]         [Moss stops]         Jen: MOSS!         [Jen bangs on glass]         Jen: MOSS!         [Camera fade]         [Jen is controlling the crane. Moss has the phone in his mouth and throws it into the shoot. Jen looks through the trap door and looks back up at Moss.]         Jen: Where is it?         Moss: I must be blocking it. I’ll try and move to clear the passage.         [Moss tries to move with no luck]         Jen: Come on, Moss.         [Moss keeps trying, sweat accumulating on his face]         Jen: Come on, Moss. You can do it. Push! Come on, Moss. Keep breathing. PUSH!         Moss: Shut up!         [Moss keeps trying]         Jen: You can do it, Moss.         Moss: I hate you!         [Moss keeps trying]         Jen: Why are you saying that?         Moss: I don’t know! Stop talking!         [Moss keeps trying]         Jen: Come on, Moss. Come on! That’s it! It’s coming! I think I can see the start button! One last push! One, two three! Push! Come on, Moss! Push! Push!         [Sound of phone entering shoot]         [Moss calms down]         [Jen, crying, holds up the phone like a newborn baby]         Moss: It’s beautiful.         Jen: "PASSWORD"!         Hint: 4 digits')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (13,'Aperture Labs social engineering experiment',200,'None','', 'You have been given special "experimental privileges". Because, you know, everyone would rather have intimate relations with an inadimate object rather than a human being.        However, during the initial development, the \"brilliant\" developers seemed to have misplaced the key that gives exclusive access to people who will pay big bucks to get even better odds of getting their ideal companion cube.        Can you dig through this and find that key? Perhaps management will give you your very own companion cube and not some raw sewage container that you will rub your face on.')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (13,'Digital safe shenanigans',200,'None','', 'Remember that guy on Reddit that posted a picture of a safe he found in the basement of his new home and didn''t show what was in it for like a year? Well that''s happening again. Now you and the entire website are growing more and more eager.        You finally lose patience and break into this individual''s house to open the safe yourself. Luckily, it is a digital safe with some simple software. It''s a good thing you know how to "hack binary files".')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (13,'Knock knock!',300,'None','', 'Last night, you had the flag. But you decided to go to a crazy party at an apartment complex down the street. During that party you drank way too many Kool-Aid bursts, got sick and bounced.        When you woke up the next morning, you realized that you had left the oh so precious flag in someone''s apartment. Brad, the concierge of the complex, is nowhere to be found. Now you have to go door to door to "find the flag".')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (13,'White cell breach',400,'None','', 'I don''t know how, but you somehow got into our "key archive". So far luck has been on your side. Now can you solve this final challenge?')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (14,'You can''t trust anyone!',100,'None','', 'I’ve never trusted sloths. Just look at those untrusting eyes, that evil glare. I’m sure "this sloth" is hiding something.')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (14,'The Lost Plane',200,'None','', 'A plane has gone missing and all we could recover is this "black box".')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (14,'Mistakes of the Past',300,'None','', 'Kitty seems to have tampered with the "computer systems" a bit after Michael fired her. Maybe you can help figure out what she did.')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (14,'1337 h4x0ring',300,'None','', 'The Cabbie Killer is at the large and has kidnapped Reed, who is live blogging from an unknown location. Our team of specialists tracked down an IP address using a GUI created in Visual Basic. From that IP we obtained a very important, password-protected ZIP file and a "memory dump" of the PC.         We know that the ZIP file and computer have the same password. We need you to obtain the password and deliver the message to us.')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (15,'Remember to cover your tracks',100,'None','', 'WOAH! You somehow managed to find the "source code" and components that generate the key for this level! Lucky you. Looking back, big mistakes were made.')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (15,'I HAVE THE POWER!',200,'None','', 'You are an electrician working for Gaussian Electrical Services. Because of your superior electric skills, the big wigs sent you to Vietnam to show your skills off and top hopefully open a new branch there.        When you arrive, you are tasked with rerouting power from an old building to a new tower that is replacing it. Sounds easy, "right"?')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (15,'Archimedes needs hardware!',200,'None','', 'Archimedes has been brought to the future by mistake! We need to put him back where he belongs, or the present could look drastically different! But we need certain hardware to do so.        From what we understand, this hardware is cheap and rather small. We tried to get the specs from our current time machine, but the damage caused by getting Archimedes here has caused it to spit out everything in a "strange encryption scheme".        We have been at this for hours...do you think you can try to solve it?')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (15,'Taking your first steps as a S.T.A.L.K.E.R.',400,'None','', 'After a long, relaxing excursion to the town of Pripyat and the areas surrounding the Chernobyl nuclear reactors, you discover an old floppy disk in your luggage with a note on it. Rather than freaking about the possible amount of radiation the disk has, you decide to pick it up to read the note.        The message is in Ukranian but luckily, you know how to read it. A majority of the message is irrelevant but you see the GPS coordinates of the location of a safe. Along with that, you read that the safe contains many invaluable things and how the key to the safe is somewhere on the disk.        When you finish reading, you go to your grandparents house and stick the irradiated floppy disk into their ancient computer. While your hair is falling out, becoming nauseated, and seeing random sores pop up, you begin to comb through the contents of the disk.        The disk contains a lot of fragmented files, and white space due to the long exposure of radiation. Now you''re bald and tasting metal, but you finally find a weird file containing a simulation program that trains new technicians. Perhaps the key somewhere in "this program"...')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (16,'Why not crypto?',50,'None','', 'You have "a message" from Matt.')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (16,'A cruel office prank',50,'None','', 'A group of people in the office have decided to take Velma''s glasses and switch out her keyboard. She''s stubborn and decided to write an e-mail that contains the key to me on her \"new\" keyboard without her glasses.         Can you translate "this email"?')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (16,'Dude where''s my key?',100,'None','', 'You’re walking down the street, on a mission to deliver a lost baby bird to its mother. Your friend, The Map, told you the way and there is one more landmark before you will get the baby bird’s treehouse.         Out of nowhere, Swiper, that stealthy fox, takes the key to the bird’s home out of your hands and throws them into a suspicious pile of other keys on the side of road. Now you have to "find your key" among the others.')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (16,'Nestling',200,'None','', 'A defecting KGB spy, codenamed \"Nestling\", has managed to smuggle some documents from a Soviet science lab in Siberia. Intelligence believes that only one of the documents is actually important as it relates to an experiment that the Kremlin has been bragging about for the past few years.        This document also contains the key that will get us into their developing version of the ARPANET. See what you can "dig up".')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (16,'Franks Cipher',300,'None','', 'I have some good news and bad news. The good news is that I''m at the console that contains the key we need. All we have to do is "read a story". The bad news is that the story is a bunch of random text that I don''t understand. There is a sticky note on the side of the screen that may help us understand the text. It says \"Blanche Fisher Wright forty-six down and one to the right.\" This may give us part of the text, if not all of it.')
GO

INSERT [dbo].[Challenge] ([Category_ID],[Challenge_Name],[Challenge_Points],[Challenge_Answer],[Challenge_Solution],[Challenge_Question]) VALUES (16,'To beam up...or not to beam up',500,'None','', 'Your friend is paranoid and constantly thinks that aliens are trying to contact her. Last night, she sent you "a picture" that she found in a google search on her own name.')
GO
