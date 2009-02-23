DROP TABLE IF EXISTS `words`;
;
DROP TABLE IF EXISTS `users`;
;
DROP TABLE IF EXISTS `usergroups`;
;
DROP TABLE IF EXISTS `userfields`; 
;
DROP TABLE IF EXISTS `topictypes`; 
;
DROP TABLE IF EXISTS `topictags`; 
;
DROP TABLE IF EXISTS `topictagcaches`; 
;
DROP TABLE IF EXISTS `topics`; 
;
DROP TABLE IF EXISTS `topicidentify`; 
;
DROP TABLE IF EXISTS `templates`; 
;
DROP TABLE IF EXISTS `tags`; 
;
DROP TABLE IF EXISTS `tablelist`; 
;
DROP TABLE IF EXISTS `statvars`; 
;
DROP TABLE IF EXISTS `stats`; 
;
DROP TABLE IF EXISTS `forumstatistics`; 
;
DROP TABLE IF EXISTS `smilies`; 
;
DROP TABLE IF EXISTS `searchcaches`; 
;
DROP TABLE IF EXISTS `scheduledevents`; 
;
DROP TABLE IF EXISTS `ratelog`; 
;
DROP TABLE IF EXISTS `posts`; 
;
DROP TABLE IF EXISTS `postid`; 
;
DROP TABLE IF EXISTS `postdebatefields`; 
;
DROP TABLE IF EXISTS `polls`; 
;
DROP TABLE IF EXISTS `polloptions`; 
;
DROP TABLE IF EXISTS `pms`; 
;
DROP TABLE IF EXISTS `paymentlog`; 
;
DROP TABLE IF EXISTS `onlinetime`; 
;
DROP TABLE IF EXISTS `onlinelist`; 
;
DROP TABLE IF EXISTS `online`; 
;
DROP TABLE IF EXISTS `mytopics`; 
;
DROP TABLE IF EXISTS `myposts`; 
;
DROP TABLE IF EXISTS `myattachments`; 
;
DROP TABLE IF EXISTS `moderators`; 
;
DROP TABLE IF EXISTS `moderatormanagelog`; 
;
DROP TABLE IF EXISTS `medalslog`; 
;
DROP TABLE IF EXISTS `medals`; 
;
DROP TABLE IF EXISTS `locations`; 
;
DROP TABLE IF EXISTS `help`; 
;
DROP TABLE IF EXISTS `forums`; 
;
DROP TABLE IF EXISTS `forumlinks`; 
;
DROP TABLE IF EXISTS `forumfields`; 
;
DROP TABLE IF EXISTS `favorites`; 
;
DROP TABLE IF EXISTS `failedlogins`; 
;
DROP TABLE IF EXISTS `debates`; 
;
DROP TABLE IF EXISTS `debatediggs`; 
;
DROP TABLE IF EXISTS `creditslog`; 
;
DROP TABLE IF EXISTS `bonuslog`; 
;
DROP TABLE IF EXISTS `bbcodes`; 
;
DROP TABLE IF EXISTS `attachtypes`; 
;
DROP TABLE IF EXISTS `attachments`; 
;
DROP TABLE IF EXISTS `announcements`; 
;
DROP TABLE IF EXISTS `advertisements`; 
;
DROP TABLE IF EXISTS `adminvisitlog`; 
;
DROP TABLE IF EXISTS `admingroups`; 
;

create table `admingroups` ( 
	`admingid` int not null,
	`alloweditpost` tinyint not null,
	`alloweditpoll` tinyint not null,
	`allowstickthread` tinyint not null,
	`allowmodpost` tinyint not null,
	`allowdelpost` tinyint not null,
	`allowmassprune` tinyint not null,
	`allowrefund` tinyint not null,
	`allowcensorword` tinyint not null,
	`allowviewip` tinyint not null,
	`allowbanip` tinyint not null,
	`allowedituser` tinyint not null,
	`allowmoduser` tinyint not null,
	`allowbanuser` tinyint not null,
	`allowpostannounce` tinyint not null,
	`allowviewlog` tinyint not null,
	`disablepostctrl` tinyint not null,
	`allowviewrealname` tinyint not null)  ENGINE=InnoDB DEFAULT CHARSET=gbk; 
;
alter table `admingroups`
	add constraint `admingroups_PK` primary key nonclustered (`admingid`);   
;
create table `adminvisitlog` ( 
	`visitid` int not null,
	`uid` int null,
	`username` varchar(20) not null,
	`groupid` int null,
	`grouptitle` varchar(50) not null,
	`ip` varchar(15) null,
	`postdatetime` datetime null,
	`actions` varchar(100) not null,
	`others` varchar(200) not null)  ENGINE=InnoDB DEFAULT CHARSET=gbk;
;
alter table `adminvisitlog`
	add constraint `adminvisitlog_PK` primary key nonclustered (`visitid`);
;
create table `advertisements` ( 
	`advid` int not null,
	`available` int not null,
	`type` varchar(50) not null,
	`displayorder` int not null,
	`title` varchar(50) not null,
	`targets` varchar(255) not null,
	`starttime` datetime not null,
	`endtime` datetime not null,
	`code` text not null,
	`parameters` text not null)  ENGINE=InnoDB DEFAULT CHARSET=gbk;
;
alter table `advertisements`
	add constraint `advertisements_PK` primary key nonclustered (`advid`); 
;
create table `announcements` ( 
	`id` int not null,
	`poster` varchar(20) not null,
	`posterid` int not null,
	`title` varchar(250) not null,
	`displayorder` int not null,
	`starttime` datetime not null,
	`endtime` datetime not null,
	`message` text not null)  ENGINE=InnoDB DEFAULT CHARSET=gbk;
;
alter table `announcements`
	add constraint `PK_announcements` primary key clustered (`id`);
;
create table `attachments` ( 
	`aid` int not null,
	`uid` int default 0 not null,
	`tid` int not null,
	`pid` int not null,
	`postdatetime` datetime not null,
	`readperm` int not null,
	`filename` char(100) not null,
	`description` char(100) not null,
	`filetype` char(50) not null,
	`filesize` int not null,
	`attachment` char(100) not null,
	`downloads` int not null)  ENGINE=InnoDB DEFAULT CHARSET=gbk;  
;
alter table `attachments`
	add constraint `PK_attachments` primary key clustered (`aid`); 
;
create table `attachtypes` ( 
	`id` int not null,
	`extension` varchar(256) not null,
	`maxsize` int not null)  ENGINE=InnoDB DEFAULT CHARSET=gbk;  
;
alter table `attachtypes`
	add constraint `attachtypes_PK` primary key nonclustered (`id`);
;
create table `bbcodes` ( 
	`id` int not null,
	`available` int not null,
	`tag` varchar(100) not null,
	`icon` varchar(50) null,
	`example` varchar(255) not null,
	`params` int not null,
	`nest` int not null,
	`explanation` text null,
	`replacement` text null,
	`paramsdescript` text null,
	`paramsdefvalue` text null)  ENGINE=InnoDB DEFAULT CHARSET=gbk;  
;
alter table `bbcodes`
	add constraint `PK_bbcodes` primary key clustered (`id`);   
;
create table `bonuslog` ( 
	`id` int not null,
	`tid` int not null,
	`authorid` int not null,
	`answerid` int not null,
	`answername` char(20) not null,
	`pid` int not null,
	`dateline` datetime not null,
	`bonus` int not null,
	`extid` tinyint not null,
	`isbest` int not null)  ENGINE=InnoDB DEFAULT CHARSET=gbk;  
;
alter table `bonuslog`
	add constraint `bonuslog_PK` primary key nonclustered (`id`);   
;
create table `creditslog` ( 
	`id` int not null,
	`uid` int not null,
	`fromto` int not null,
	`sendcredits` tinyint not null,
	`receivecredits` tinyint not null,
	`send` float not null,
	`receive` float not null,
	`paydate` datetime not null,
	`operation` tinyint not null)  ENGINE=InnoDB DEFAULT CHARSET=gbk;  
;
alter table `creditslog`
	add constraint `PK_creditslog` primary key clustered (`id`); 
;
create table `debatediggs` ( 
	`tid` int not null,
	`pid` int not null,
	`digger` char(20) not null,
	`diggerid` int not null,
	`diggerip` char(15) not null,
	`diggdatetime` datetime not null)  ENGINE=InnoDB DEFAULT CHARSET=gbk;  
;
alter table `debatediggs`
	add constraint `debatediggs_PK` primary key nonclustered (`tid`);  
;
create table `debates` ( 
	`tid` int not null,
	`positiveopinion` varchar(200) not null,
	`negativeopinion` varchar(200) not null,
	`terminaltime` datetime not null,
	`positivediggs` int default 0 not null,
	`negativediggs` int default 0 not null)  ENGINE=InnoDB DEFAULT CHARSET=gbk;  
;
alter table `debates`
	add constraint `PK_debate` primary key clustered (`tid`);   
;
create table `failedlogins` ( 
	`ip` char(15) not null,
	`errcount` int default 0 not null,
	`lastupdate` datetime not null)  ENGINE=InnoDB DEFAULT CHARSET=gbk;  
;
alter table `failedlogins`
	add constraint `PK_failedlogins` primary key clustered (`ip`);  
;
create table `favorites` ( 
	`id` int not null,
	`uid` int not null,
	`tid` int not null,
	`typeid` tinyint default 0 not null)  ENGINE=InnoDB DEFAULT CHARSET=gbk;  
;
alter table `favorites`
	add constraint `favorites_PK` primary key nonclustered (`id`);   
;
create table `forumfields` ( 
	`fid` int not null,
	`password` varchar(16) not null,
	`icon` varchar(255) null,
	`postcredits` varchar(255) null,
	`replycredits` varchar(255) null,
	`redirect` varchar(255) null,
	`attachextensions` varchar(255) null,
	`rules` text null,
	`topictypes` text null,
	`viewperm` text null,
	`postperm` text null,
	`replyperm` text null,
	`getattachperm` text null,
	`postattachperm` text null,
	`moderators` text null,
	`description` text null,
	`applytopictype` tinyint default 0 not null,
	`postbytopictype` tinyint default 0 not null,
	`viewbytopictype` tinyint default 0 not null,
	`topictypeprefix` tinyint default 0 not null,
	`permuserlist` text null)  ENGINE=InnoDB DEFAULT CHARSET=gbk;  
;
alter table `forumfields`
	add constraint `forumfields_PK` primary key nonclustered (`fid`);  
;
create table `forumlinks` ( 
	`id` int not null,
	`displayorder` int not null,
	`name` varchar(100) not null,
	`url` varchar(100) not null,
	`note` varchar(200) not null,
	`logo` varchar(100) not null)  ENGINE=InnoDB DEFAULT CHARSET=gbk;  
;
alter table `forumlinks`
	add constraint `forumlinks_PK` primary key nonclustered (`id`); 
;
create table `forums` ( 
	`fid` int not null,
	`parentid` int default 0 null,
	`layer` int default 0 not null,
	`pathlist` varchar(255) not null,
	`parentidlist` char(255) not null,
	`subforumcount` int not null,
	`name` char(50) not null,
	`status` int default 0 not null,
	`colcount` int default 1 not null,
	`displayorder` int default 0 not null,
	`templateid` int default 0 not null,
	`topics` int default 0 not null,
	`curtopics` int default 0 not null,
	`posts` int default 0 not null,
	`todayposts` int default 0 not null,
	`lasttid` int default 0 null,
	`lasttitle` char(60) null,
	`lastpost` datetime null,
	`lastposterid` int null,
	`lastposter` char(20) null,
	`allowsmilies` int default 0 not null,
	`allowrss` int default 0 not null,
	`allowhtml` int default 0 not null,
	`allowbbcode` int default 0 not null,
	`allowimgcode` int default 0 not null,
	`allowblog` int default 0 not null,
	`istrade` int default 0 not null,
	`allowpostspecial` int default 0 not null,
	`allowspecialonly` int default 0 null,
	`alloweditrules` int default 0 not null,
	`allowthumbnail` int default 0 not null,
	`allowtag` int default 0 not null,
	`recyclebin` int default 0 not null,
	`modnewposts` int default 0 not null,
	`jammer` int default 0 not null,
	`disablewatermark` int default 0 not null,
	`inheritedmod` int default 0 not null,
	`autoclose` int default 0 not null)  ENGINE=InnoDB DEFAULT CHARSET=gbk;  
;
alter table `forums`
	add constraint `PK_forums` primary key clustered (`fid`);  
;
create table `help` ( 
	`id` int not null,
	`title` varchar(100) not null,
	`message` text null,
	`pid` int not null,
	`orderby` int default 0 null)  ENGINE=InnoDB DEFAULT CHARSET=gbk;
;
alter table `help`
	add constraint `help_PK` primary key nonclustered (`id`);  
;
create table `locations` ( 
	`lid` int not null,
	`city` varchar(50) not null,
	`state` varchar(50) not null,
	`country` varchar(50) not null,
	`zipcode` varchar(20) not null)  ENGINE=InnoDB DEFAULT CHARSET=gbk; 
;
alter table `locations`
	add constraint `locations_PK` primary key nonclustered (`lid`); 
;
create table `medals` ( 
	`medalid` int not null,
	`name` varchar(50) not null,
	`available` int default 0 not null,
	`image` varchar(30) not null)  ENGINE=InnoDB DEFAULT CHARSET=gbk;  
;
alter table `medals`
	add constraint `medals_PK` primary key nonclustered (`medalid`);   
;
create table `medalslog` ( 
	`id` int not null,
	`adminname` varchar(50) null,
	`ip` varchar(15) null,
	`postdatetime` datetime null,
	`username` varchar(50) null,
	`uid` int null,
	`actions` varchar(100) null,
	`medals` int null,
	`reason` varchar(100) null,
	`admingid` int null)  ENGINE=InnoDB DEFAULT CHARSET=gbk;  
;
alter table `medalslog`
	add constraint `medalslog_PK` primary key nonclustered (`id`);   
;
create table `moderatormanagelog` ( 
	`id` int not null,
	`moderatoruid` int null,
	`moderatorname` varchar(50) null,
	`groupid` int null,
	`grouptitle` varchar(50) null,
	`ip` varchar(15) null,
	`postdatetime` datetime null,
	`fid` int null,
	`fname` varchar(100) null,
	`tid` int null,
	`title` varchar(200) null,
	`actions` varchar(50) null,
	`reason` varchar(200) null)  ENGINE=InnoDB DEFAULT CHARSET=gbk;
;
alter table `moderatormanagelog`
	add constraint `moderatormanagelog_PK` primary key nonclustered (`id`);  
;
create table `moderators` ( 
	`id` int not null,
	`uid` int not null,
	`fid` int not null,
	`displayorder` int not null,
	`inherited` int not null)  ENGINE=InnoDB DEFAULT CHARSET=gbk;  
;
alter table `moderators`
	add constraint `moderators_PK` primary key nonclustered (`id`);   
;
create table `myattachments` ( 
	`id` int not null,
	`aid` int not null,
	`uid` int not null,
	`attachment` char(100) not null,
	`description` char(100) not null,
	`postdatetime` datetime not null,
	`downloads` int not null,
	`filename` char(100) not null,
	`pid` int default 0 not null,
	`tid` int default 0 not null,
	`extname` varchar(50) not null)  ENGINE=InnoDB DEFAULT CHARSET=gbk;  
;
alter table `myattachments`
	add constraint `myattachments_PK` primary key nonclustered (`id`);   
;
create table `myposts` ( 
	`id` int not null,
	`uid` int not null,
	`tid` int not null,
	`pid` int not null,
	`dateline` datetime not null)  ENGINE=InnoDB DEFAULT CHARSET=gbk;  
;
alter table `myposts`
	add constraint `myposts_PK` primary key nonclustered (`id`);   
;
create table `mytopics` ( 
	`id` int not null,
	`uid` int not null,
	`tid` int not null,
	`dateline` datetime not null)  ENGINE=InnoDB DEFAULT CHARSET=gbk;  
;
alter table `mytopics`
	add constraint `mytopics_PK` primary key nonclustered (`id`);   
;
create table `online` ( 
	`olid` int not null,
	`userid` int default -1 null,
	`ip` varchar(15) not null,
	`username` varchar(20) not null,
	`nickname` varchar(20) not null,
	`password` char(32) not null,
	`groupid` int default 0 not null,
	`olimg` varchar(80) not null,
	`invisible` int default 0 not null,
	`action` int default 0 not null,
	`lastactivity` int default 0 not null,
	`lastposttime` datetime not null,
	`lastpostpmtime` datetime not null,
	`lastsearchtime` datetime not null,
	`lastupdatetime` datetime null,
	`forumid` int default 0 null,
	`forumname` varchar(50) null,
	`titleid` int default 0 null,
	`title` varchar(80) null,
	`verifycode` varchar(10) not null,
	`admingid` int null)  ENGINE=InnoDB DEFAULT CHARSET=gbk;  
;
alter table `online`
	add constraint `PK_online` primary key clustered (`olid`);   
;
create table `onlinelist` ( 
	`groupid` int not null,
	`displayorder` int null,
	`title` varchar(50) not null,
	`img` varchar(50) null)  ENGINE=InnoDB DEFAULT CHARSET=gbk;   
;
alter table `onlinelist`
	add constraint `onlinelist_PK` primary key nonclustered (`groupid`);   
;
create table `onlinetime` ( 
	`uid` int not null,
	`thismonth` int default 0 not null,
	`total` int default 0 not null,
	`lastupdate` datetime not null)  ENGINE=InnoDB DEFAULT CHARSET=gbk;  
;
alter table `onlinetime`
	add constraint `PK_onlinetime` primary key clustered (`uid`);   
;
create table `paymentlog` ( 
	`id` int not null,
	`uid` int not null,
	`tid` int not null,
	`authorid` int not null,
	`buydate` datetime not null,
	`amount` int not null,
	`netamount` int not null)  ENGINE=InnoDB DEFAULT CHARSET=gbk;  
;
alter table `paymentlog`
	add constraint `PK_paymentlog` primary key clustered (`id`);  
;
create table `pms` ( 
	`pmid` int not null,
	`msgfrom` varchar(50) not null,
	`msgfromid` int not null,
	`msgto` varchar(50) not null,
	`msgtoid` int not null,
	`folder` int not null,
	`new` int not null,
	`subject` varchar(60) not null,
	`postdatetime` datetime not null,
	`message` text not null)  ENGINE=InnoDB DEFAULT CHARSET=gbk;  
;
alter table `pms`
	add constraint `PK_pms` primary key clustered (`pmid`); 
;
create table `polloptions` ( 
	`polloptionid` int not null,
	`tid` int default 0 not null,
	`pollid` int default 0 not null,
	`votes` int default 0 not null,
	`displayorder` int default 0 not null,
	`polloption` varchar(80) not null,
	`voternames` text not null)  ENGINE=InnoDB DEFAULT CHARSET=gbk;  
;
alter table `polloptions`
	add constraint `PK_polloptions` primary key clustered (`polloptionid`);  
;
create table `polls` ( 
	`pollid` int not null,
	`tid` int default 0 not null,
	`displayorder` int not null,
	`multiple` tinyint default 0 not null,
	`visible` tinyint default 0 not null,
	`maxchoices` int default 0 not null,
	`expiration` datetime not null,
	`uid` int default 0 not null,
	`voternames` text not null)  ENGINE=InnoDB DEFAULT CHARSET=gbk;  
;
alter table `polls`
	add constraint `polls_PK` primary key nonclustered (`pollid`); 
;
create table `postdebatefields` ( 
	`tid` int default 0 not null,
	`pid` int default 0 not null,
	`opinion` int default 0 not null,
	`diggs` int default 0 not null)  ENGINE=InnoDB DEFAULT CHARSET=gbk;  
;
alter table `postdebatefields`
	add constraint `postdebatefields_PK` primary key nonclustered (`tid`); 
;
create table `postid` ( 
	`pid` int not null,
	`postdatetime` datetime not null)  ENGINE=InnoDB DEFAULT CHARSET=gbk;  
;
alter table `postid`
	add constraint `PK_postid` primary key clustered (`pid`);   
;
create table `posts` ( 
	`pid` int default 0 not null,
	`fid` int not null,
	`tid` int not null,
	`parentid` int default 0 null,
	`layer` int default 0 not null,
	`poster` varchar(20) not null,
	`posterid` int default 0 not null,
	`title` varchar(60) not null,
	`postdatetime` datetime not null,
	`message` text not null,
	`ip` varchar(15) not null,
	`lastedit` varchar(50) not null,
	`invisible` int default 0 not null,
	`usesig` int default 0 not null,
	`htmlon` int default 0 not null,
	`smileyoff` int default 0 not null,
	`parseurloff` int default 0 not null,
	`bbcodeoff` int default 0 not null,
	`attachment` int default 0 not null,
	`rate` int default 0 not null,
	`ratetimes` int default 0 not null)  ENGINE=InnoDB DEFAULT CHARSET=gbk;
;
alter table `posts`
	add constraint `PK_posts1` primary key clustered (`pid`);  
;
create table `ratelog` ( 
	`id` int not null,
	`pid` int not null,
	`uid` int not null,
	`username` char(20) not null,
	`extcredits` tinyint not null,
	`postdatetime` datetime not null,
	`score` int not null,
	`reason` varchar(50) not null)  ENGINE=InnoDB DEFAULT CHARSET=gbk;  
;
alter table `ratelog`
	add constraint `PK_ratelog` primary key clustered (`id`);   
;
create table `scheduledevents` ( 
	`scheduleID` int not null,
	`key` varchar(50) not null,
	`lastexecuted` datetime not null,
	`servername` varchar(100) not null)  ENGINE=InnoDB DEFAULT CHARSET=gbk;  
;
alter table `scheduledevents`
	add constraint `scheduledevents_PK` primary key nonclustered (`scheduleID`);   
;
create table `searchcaches` ( 
	`searchid` int not null,
	`keywords` varchar(255) not null,
	`searchstring` varchar(255) not null,
	`ip` varchar(15) not null,
	`uid` int not null,
	`groupid` int not null,
	`postdatetime` datetime not null,
	`expiration` datetime not null,
	`topics` int not null,
	`tids` text not null)  ENGINE=InnoDB DEFAULT CHARSET=gbk;  
;
alter table `searchcaches`
	add constraint `PK_searchindex` primary key clustered (`searchid`);   
;
create table `smilies` ( 
	`id` int not null,
	`displayorder` int not null,
	`type` int not null,
	`code` varchar(30) not null,
	`url` varchar(60) not null)  ENGINE=InnoDB DEFAULT CHARSET=gbk;  
;
alter table `smilies`
	add constraint `smilies_PK` primary key nonclustered (`id`); 
;
create table `forumstatistics` ( 
	`id` int not null,
	`totaltopic` int not null,
	`totalpost` int not null,
	`totalusers` int not null,
	`lastusername` char(20) not null,
	`lastuserid` int not null,
	`highestonlineusercount` int null,
	`highestonlineusertime` datetime null,
	`yesterdayposts` int default 0 not null,
	`highestposts` int default 0 not null,
	`highestpostsdate` char(10) not null)  ENGINE=InnoDB DEFAULT CHARSET=gbk;  
;
alter table `forumstatistics`
	add constraint `forumstatistics_PK` primary key nonclustered (`id`);   
;
create table `stats` ( 
	`type` char(10) not null,
	`variable` char(20) not null,
	`count` int default 0 not null)  
;
alter table `stats`
	add constraint `IX_stats` primary key nonclustered (`type`);   
;
create table `statvars` ( 
	`type` char(20) not null,
	`variable` char(20) not null,
	`value` text not null)  ENGINE=InnoDB DEFAULT CHARSET=gbk;  
;
alter table `statvars`
	add constraint `statvars_PK` primary key nonclustered (`type`);   
;
create table `tablelist` ( 
	`id` int not null,
	`createdatetime` datetime not null,
	`description` varchar(50) not null,
	`mintid` int default -1 not null,
	`maxtid` int default -1 not null)  ENGINE=InnoDB DEFAULT CHARSET=gbk;  
;
alter table `tablelist`
	add constraint `PK_tablelist` primary key clustered (`id`);  
;
create table `tags` ( 
	`tagid` int not null,
	`tagname` char(10) not null,
	`userid` int default 0 not null,
	`postdatetime` datetime not null,
	`orderid` int default 0 not null,
	`color` char(6) not null,
	`count` int default 0 not null,
	`fcount` int default 0 not null,
	`pcount` int default 0 not null,
	`scount` int default 0 not null,
	`vcount` int default 0 not null,
	`gcount` int default 0 not null)  ENGINE=InnoDB DEFAULT CHARSET=gbk;  
;
alter table `tags`
	add constraint `PK_tags` primary key clustered (`tagid`);  
;
create table `templates` ( 
	`templateid` int not null,
	`directory` varchar(100) not null,
	`name` varchar(50) not null,
	`author` varchar(100) not null,
	`createdate` varchar(50) not null,
	`ver` varchar(100) not null,
	`fordntver` varchar(100) not null,
	`copyright` varchar(100) not null)  ENGINE=InnoDB DEFAULT CHARSET=gbk;  
;
alter table `templates`
	add constraint `PK_templates` primary key clustered (`templateid`);   
;
create table `topicidentify` ( 
	`identifyid` int not null,
	`name` varchar(50) not null,
	`filename` varchar(50) not null)  ENGINE=InnoDB DEFAULT CHARSET=gbk;  
;
alter table `topicidentify`
	add constraint `PK_topicidentify` primary key clustered (`identifyid`);   
;
create table `topics` ( 
	`tid` int not null,
	`fid` int not null,
	`iconid` tinyint default 0 not null,
	`typeid` int default 0 not null,
	`readperm` int default 0 not null,
	`price` int default 0 not null,
	`poster` char(20) not null,
	`posterid` int default 0 not null,
	`title` char(60) not null,
	`postdatetime` datetime not null,
	`lastpost` datetime not null,
	`lastpostid` int default 0 not null,
	`lastposter` char(20) not null,
	`lastposterid` int default 0 not null,
	`views` int default 0 not null,
	`replies` int default 0 not null,
	`displayorder` int default 0 not null,
	`highlight` varchar(255) not null,
	`digest` tinyint default 0 not null,
	`rate` int default 0 not null,
	`hide` int default 0 not null,
	`poll` int default 0 not null,
	`attachment` int default 0 not null,
	`moderated` tinyint default 0 not null,
	`closed` int default 0 not null,
	`magic` int default 0 not null,
	`identify` int default 0 not null,
	`special` tinyint default 0 not null)  
;
alter table `topics`
	add constraint `PK_topics` primary key nonclustered (`tid`);   
;
create table `topictagcaches` ( 
	`tid` int default 0 not null,
	`linktid` int default 0 not null,
	`linktitle` char(60) not null)  ENGINE=InnoDB DEFAULT CHARSET=gbk;  
;
alter table `topictagcaches`
	add constraint `topictagcaches_PK` primary key nonclustered (`tid`);   
;
create table `topictags` ( 
	`tagid` int default 0 not null,
	`tid` int default 0 not null)  ENGINE=InnoDB DEFAULT CHARSET=gbk;  
;
alter table `topictags`
	add constraint `topictags_PK` primary key nonclustered (`tagid`);   
;
create table `topictypes` ( 
	`typeid` int not null,
	`displayorder` int default 0 not null,
	`name` varchar(30) not null,
	`description` varchar(500) not null)  ENGINE=InnoDB DEFAULT CHARSET=gbk;  
;
alter table `topictypes`
	add constraint `topictypes_PK` primary key nonclustered (`typeid`);   
;
create table `userfields` ( 
	`uid` int not null,
	`website` varchar(80) not null,
	`icq` varchar(12) not null,
	`qq` varchar(12) not null,
	`yahoo` varchar(40) not null,
	`msn` varchar(40) not null,
	`skype` varchar(40) not null,
	`location` varchar(50) not null,
	`customstatus` varchar(50) not null,
	`avatar` varchar(255) not null,
	`avatarwidth` int default 60 not null,
	`avatarheight` int default 60 not null,
	`medals` varchar(300) not null,
	`bio` varchar(500) not null,
	`signature` varchar(500) not null,
	`sightml` varchar(1000) not null,
	`authstr` varchar(20) not null,
	`authtime` datetime not null,
	`authflag` tinyint default 0 not null,
	`realname` varchar(10) not null,
	`idcard` varchar(20) not null,
	`mobile` varchar(20) not null,
	`phone` varchar(20) not null)  ENGINE=InnoDB DEFAULT CHARSET=gbk;  
;
alter table `userfields`
	add constraint `PK_userfields` primary key clustered (`uid`);   
;
create table `usergroups` ( 
	`groupid` int not null,
	`type` int default 0 null,
	`system` int default 0 not null,
	`grouptitle` varchar(50) not null,
	`creditshigher` int not null,
	`creditslower` int null,
	`stars` int not null,
	`color` char(7) not null,
	`groupavatar` varchar(60) not null,
	`readaccess` int not null,
	`allowvisit` int not null,
	`allowpost` int not null,
	`allowreply` int not null,
	`allowpostpoll` int not null,
	`allowdirectpost` int not null,
	`allowgetattach` int not null,
	`allowpostattach` int not null,
	`allowvote` int not null,
	`allowmultigroups` int not null,
	`allowsearch` int not null,
	`allowavatar` int not null,
	`allowcstatus` int not null,
	`allowuseblog` int not null,
	`allowinvisible` int not null,
	`allowtransfer` int not null,
	`allowsetreadperm` int not null,
	`allowsetattachperm` int not null,
	`allowhidecode` int not null,
	`allowhtml` int not null,
	`allowcusbbcode` int not null,
	`allownickname` int not null,
	`allowsigbbcode` int not null,
	`allowsigimgcode` int not null,
	`allowviewpro` int not null,
	`allowviewstats` int not null,
	`disableperiodctrl` int not null,
	`reasonpm` int not null,
	`maxprice` int not null,
	`maxpmnum` int not null,
	`maxsigsize` int not null,
	`maxattachsize` int not null,
	`maxsizeperday` int not null,
	`attachextensions` char(100) not null,
	`raterange` char(255) not null,
	`allowspace` int default 0 not null,
	`maxspaceattachsize` int default 0 not null,
	`maxspacephotosize` int default 0 not null,
	`allowdebate` int default 0 not null,
	`allowbonus` int default 0 not null,
	`minbonusprice` int default 0 not null,
	`maxbonusprice` int default 0 not null,
	`allowtrade` int default 0 not null,
	`allowdiggs` int default 0 not null,
	`admingid` int null)  ENGINE=InnoDB DEFAULT CHARSET=gbk;  
;
alter table `usergroups`
	add constraint `PK_usergroups` primary key clustered (`groupid`);   
;
create table `users` ( 
	`uid` int not null,
	`username` char(20) not null,
	`nickname` char(20) not null,
	`password` char(32) not null,
	`secques` char(8) not null,
	`spaceid` int default 0 not null,
	`gender` int default 0 not null,
	`groupid` int default 0 not null,
	`groupexpiry` int default 0 not null,
	`extgroupids` char(60) not null,
	`regip` char(15) not null,
	`joindate` datetime not null,
	`lastip` char(15) not null,
	`lastvisit` datetime not null,
	`lastactivity` datetime not null,
	`lastpost` datetime not null,
	`lastpostid` int default 0 not null,
	`lastposttitle` char(60) not null,
	`posts` int default 0 not null,
	`digestposts` int default 0 not null,
	`oltime` int default 0 not null,
	`pageviews` int default 0 not null,
	`credits` int default 0 not null,
	`extcredits1` decimal(18,2) default 0 not null,
	`extcredits2` decimal(18,2) default 0 not null,
	`extcredits3` decimal(18,2) default 0 not null,
	`extcredits4` decimal(18,2) default 0 not null,
	`extcredits5` decimal(18,2) default 0 not null,
	`extcredits6` decimal(18,2) default 0 not null,
	`extcredits7` decimal(18,2) default 0 not null,
	`extcredits8` decimal(18,2) default 0 not null,
	`avatarshowid` int default 0 not null,
	`email` char(50) not null,
	`bday` char(10) not null,
	`sigstatus` int default 0 not null,
	`tpp` int default 0 not null,
	`ppp` int default 0 not null,
	`templateid` int default 0 not null,
	`pmsound` int default 0 not null,
	`showemail` int default 0 not null,
	`invisible` int default 0 not null,
	`newpm` int default 0 not null,
	`newpmcount` int default 0 not null,
	`accessmasks` int default 0 not null,
	`onlinestate` int default 0 not null,
	`newsletter` int default 7 not null,
	`admingid` int null)  ENGINE=InnoDB DEFAULT CHARSET=gbk;  
;
alter table `users`
	add constraint `PK_members` primary key clustered (`uid`);   
;
create table `words` ( 
	`id` int not null,
	`admin` varchar(20) not null,
	`find` varchar(255) not null,
	`replacement` varchar(255) not null)  ENGINE=InnoDB DEFAULT CHARSET=gbk;
;
alter table `words`
	add constraint `words_PK` primary key nonclustered (`id`);   
;


INSERT INTO forums (fid,parentid, layer,pathlist,parentidlist,subforumcount,name,status,colcount,displayorder,templateid,topics,curtopics,posts,todayposts,lasttid,lasttitle,lastpost,lastposterid,lastposter,allowsmilies,allowrss,allowhtml,allowbbcode,allowimgcode,allowblog,istrade,alloweditrules,allowthumbnail,recyclebin,modnewposts,jammer,disablewatermark,inheritedmod,autoclose) VALUES (1,0, 0, '<a href="showforum.action?forumid=1">Ĭ�Ϸ���</a>', '0', 1, 'Ĭ�Ϸ���', 1, 1, 1, 0, 0, 0, 0, 0, 0, '', '1900-1-1 0:00:00', 0, '', 1, 1, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0)
;
INSERT INTO forumfields VALUES (1,'','', '', '', '', '', '', '', '', '', '', '', '', '', '',0,0,0,0,'')
;


INSERT INTO forums (fid,parentid, layer,pathlist,parentidlist,subforumcount,name,status,colcount,displayorder,templateid,topics,curtopics,posts,todayposts,lasttid,lasttitle,lastpost,lastposterid,lastposter,allowsmilies,allowrss,allowhtml,allowbbcode,allowimgcode,allowblog,istrade,allowpostspecial,alloweditrules,allowthumbnail,allowtag,recyclebin,modnewposts,jammer,disablewatermark,inheritedmod,autoclose) VALUES (2,1, 1, '<a href="showforum.action?forumid=1">Ĭ�Ϸ���</a><a href="showforum.action?forumid=2">Ĭ�ϰ��</a>', '1', 0, 'Ĭ�ϰ��', 1, 1, 2, 0, 0, 0, 0, 0, 0, '', '1900-1-1 0:00:00', 0, '', 1, 1, 0, 1, 1, 0, 0, 21, 0, 0, 1, 0, 0, 0, 0, 0, 0)
;
INSERT INTO forumfields VALUES (2,'', '', '', '', '', '', '', '', '', '', '', '', '', '', 'Ĭ�ϰ��˵������',0,0,0,0,'')
;


INSERT INTO usergroups (groupid,admingid,type,system,grouptitle,creditshigher,creditslower,stars,color,groupavatar,readaccess,allowvisit,allowpost,allowreply,allowpostpoll,allowdirectpost,allowgetattach,allowpostattach,allowvote,allowmultigroups,allowsearch,allowavatar,allowcstatus,allowuseblog,allowinvisible,allowtransfer,allowsetreadperm,allowsetattachperm,allowhidecode,allowhtml,allowcusbbcode,allownickname,allowsigbbcode,allowsigimgcode,allowviewpro,allowviewstats,disableperiodctrl,reasonpm,maxprice,maxpmnum,maxsigsize,maxattachsize,maxsizeperday,attachextensions,raterange,allowspace,maxspaceattachsize,maxspacephotosize,allowdebate,allowbonus,minbonusprice,maxbonusprice,allowtrade,allowdiggs) VALUES (1,1, 0, 1, '����Ա', 0, 0, 9,'' , '', 255, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 3, 0, 0, 0, 0, 1,1, 1,0, 1, 0, 1, 1, 1, 1, 1, 0, 30, 200, 500, 99999999,99999999, '', '1,True,extcredits1,����,-50,50,300|2,False,extcredits2,��Ǯ,-50,50,300|3,False,extcredits3,,,,|4,False,extcredits4,,,,|5,False,extcredits5,,,,|6,False,extcredits6,,,,|7,False,extcredits7,,,,|8,False,extcredits8,,,,', 1,99999999, 99999999, 1, 1, 1, 100, 1, 1)
;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              
INSERT INTO usergroups (groupid,admingid,type,system,grouptitle,creditshigher,creditslower,stars,color,groupavatar,readaccess,allowvisit,allowpost,allowreply,allowpostpoll,allowdirectpost,allowgetattach,allowpostattach,allowvote,allowmultigroups,allowsearch,allowavatar,allowcstatus,allowuseblog,allowinvisible,allowtransfer,allowsetreadperm,allowsetattachperm,allowhidecode,allowhtml,allowcusbbcode,allownickname,allowsigbbcode,allowsigimgcode,allowviewpro,allowviewstats,disableperiodctrl,reasonpm,maxprice,maxpmnum,maxsigsize,maxattachsize,maxsizeperday,attachextensions,raterange,allowspace,maxspaceattachsize,maxspacephotosize,allowdebate,allowbonus,minbonusprice,maxbonusprice,allowtrade,allowdiggs) VALUES (2,2, 0, 1, '��������', 0, 0, 8, '', '', 255, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 3, 0, 0, 0, 0, 1, 1, 1, 0, 1, 0, 1, 1, 1, 1, 1, 3, 20, 120, 300, 99999999, 99999999, '', '1,True,extcredits1,����,-50,50,100|2,False,extcredits2,��Ǯ,-30,30,50|3,False,extcredits3,,,,|4,False,extcredits4,,,,|5,False,extcredits5,,,,|6,False,extcredits6,,,,|7,False,extcredits7,,,,|8,False,extcredits8,,,,', 1, 99999999, 99999999, 1, 1, 1, 90, 1, 1)
;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 
INSERT INTO usergroups (groupid,admingid,type,system,grouptitle,creditshigher,creditslower,stars,color,groupavatar,readaccess,allowvisit,allowpost,allowreply,allowpostpoll,allowdirectpost,allowgetattach,allowpostattach,allowvote,allowmultigroups,allowsearch,allowavatar,allowcstatus,allowuseblog,allowinvisible,allowtransfer,allowsetreadperm,allowsetattachperm,allowhidecode,allowhtml,allowcusbbcode,allownickname,allowsigbbcode,allowsigimgcode,allowviewpro,allowviewstats,disableperiodctrl,reasonpm,maxprice,maxpmnum,maxsigsize,maxattachsize,maxsizeperday,attachextensions,raterange,allowspace,maxspaceattachsize,maxspacephotosize,allowdebate,allowbonus,minbonusprice,maxbonusprice,allowtrade,allowdiggs) VALUES (3,3, 0, 1, '����', 0, 0, 7, '', '', 200, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 3, 0, 0, 0, 0, 1, 1, 1, 0, 1, 0, 1, 1, 1, 1, 1, 3, 10, 80, 200, 4194304, 33554432, '', '1,True,extcredits1,����,-30,30,50|2,False,extcredits2,��Ǯ,-10,10,30|3,False,extcredits3,,,,|4,False,extcredits4,,,,|5,False,extcredits5,,,,|6,False,extcredits6,,,,|7,False,extcredits7,,,,|8,False,extcredits8,,,,', 1, 33554432, 33554432, 1, 1, 1, 80, 1, 1)
;
INSERT INTO usergroups (groupid,admingid,type,system,grouptitle,creditshigher,creditslower,stars,color,groupavatar,readaccess,allowvisit,allowpost,allowreply,allowpostpoll,allowdirectpost,allowgetattach,allowpostattach,allowvote,allowmultigroups,allowsearch,allowavatar,allowcstatus,allowuseblog,allowinvisible,allowtransfer,allowsetreadperm,allowsetattachperm,allowhidecode,allowhtml,allowcusbbcode,allownickname,allowsigbbcode,allowsigimgcode,allowviewpro,allowviewstats,disableperiodctrl,reasonpm,maxprice,maxpmnum,maxsigsize,maxattachsize,maxsizeperday,attachextensions,raterange,allowspace,maxspaceattachsize,maxspacephotosize,allowdebate,allowbonus,minbonusprice,maxbonusprice,allowtrade,allowdiggs) VALUES (4,0, 0, 1, '��ֹ����', 0, 0, 0,'', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 1)
;
INSERT INTO usergroups (groupid,admingid,type,system,grouptitle,creditshigher,creditslower,stars,color,groupavatar,readaccess,allowvisit,allowpost,allowreply,allowpostpoll,allowdirectpost,allowgetattach,allowpostattach,allowvote,allowmultigroups,allowsearch,allowavatar,allowcstatus,allowuseblog,allowinvisible,allowtransfer,allowsetreadperm,allowsetattachperm,allowhidecode,allowhtml,allowcusbbcode,allownickname,allowsigbbcode,allowsigimgcode,allowviewpro,allowviewstats,disableperiodctrl,reasonpm,maxprice,maxpmnum,maxsigsize,maxattachsize,maxsizeperday,attachextensions,raterange,allowspace,maxspaceattachsize,maxspacephotosize,allowdebate,allowbonus,minbonusprice,maxbonusprice,allowtrade,allowdiggs) VALUES (5,0, 0, 1, '��ֹ����', 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0)
;                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
INSERT INTO usergroups (groupid,admingid,type,system,grouptitle,creditshigher,creditslower,stars,color,groupavatar,readaccess,allowvisit,allowpost,allowreply,allowpostpoll,allowdirectpost,allowgetattach,allowpostattach,allowvote,allowmultigroups,allowsearch,allowavatar,allowcstatus,allowuseblog,allowinvisible,allowtransfer,allowsetreadperm,allowsetattachperm,allowhidecode,allowhtml,allowcusbbcode,allownickname,allowsigbbcode,allowsigimgcode,allowviewpro,allowviewstats,disableperiodctrl,reasonpm,maxprice,maxpmnum,maxsigsize,maxattachsize,maxsizeperday,attachextensions,raterange,allowspace,maxspaceattachsize,maxspacephotosize,allowdebate,allowbonus,minbonusprice,maxbonusprice,allowtrade,allowdiggs) VALUES (6,0, 0, 1, '��ֹ IP', 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0)
;
INSERT INTO usergroups (groupid,admingid,type,system,grouptitle,creditshigher,creditslower,stars,color,groupavatar,readaccess,allowvisit,allowpost,allowreply,allowpostpoll,allowdirectpost,allowgetattach,allowpostattach,allowvote,allowmultigroups,allowsearch,allowavatar,allowcstatus,allowuseblog,allowinvisible,allowtransfer,allowsetreadperm,allowsetattachperm,allowhidecode,allowhtml,allowcusbbcode,allownickname,allowsigbbcode,allowsigimgcode,allowviewpro,allowviewstats,disableperiodctrl,reasonpm,maxprice,maxpmnum,maxsigsize,maxattachsize,maxsizeperday,attachextensions,raterange,allowspace,maxspaceattachsize,maxspacephotosize,allowdebate,allowbonus,minbonusprice,maxbonusprice,allowtrade,allowdiggs) VALUES (7,0, 0, 1, '�ο�', 0, 0, 0, '', '', 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0)
;
INSERT INTO usergroups (groupid,admingid,type,system,grouptitle,creditshigher,creditslower,stars,color,groupavatar,readaccess,allowvisit,allowpost,allowreply,allowpostpoll,allowdirectpost,allowgetattach,allowpostattach,allowvote,allowmultigroups,allowsearch,allowavatar,allowcstatus,allowuseblog,allowinvisible,allowtransfer,allowsetreadperm,allowsetattachperm,allowhidecode,allowhtml,allowcusbbcode,allownickname,allowsigbbcode,allowsigimgcode,allowviewpro,allowviewstats,disableperiodctrl,reasonpm,maxprice,maxpmnum,maxsigsize,maxattachsize,maxsizeperday,attachextensions,raterange,allowspace,maxspaceattachsize,maxspacephotosize,allowdebate,allowbonus,minbonusprice,maxbonusprice,allowtrade,allowdiggs) VALUES (8,0, 0, 1, '�ȴ���֤��Ա', 0, 0, 0, '', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 0, 50, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0)
;
INSERT INTO usergroups (groupid,admingid,type,system,grouptitle,creditshigher,creditslower,stars,color,groupavatar,readaccess,allowvisit,allowpost,allowreply,allowpostpoll,allowdirectpost,allowgetattach,allowpostattach,allowvote,allowmultigroups,allowsearch,allowavatar,allowcstatus,allowuseblog,allowinvisible,allowtransfer,allowsetreadperm,allowsetattachperm,allowhidecode,allowhtml,allowcusbbcode,allownickname,allowsigbbcode,allowsigimgcode,allowviewpro,allowviewstats,disableperiodctrl,reasonpm,maxprice,maxpmnum,maxsigsize,maxattachsize,maxsizeperday,attachextensions,raterange,allowspace,maxspaceattachsize,maxspacephotosize,allowdebate,allowbonus,minbonusprice,maxbonusprice,allowtrade,allowdiggs) VALUES (9,0, 0, 0, '��ؤ', -9999999, 0, 0, '', '', 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '', '', 0, 0, 0, 0, 0, 0, 0, 0, 0)
;
INSERT INTO usergroups (groupid,admingid,type,system,grouptitle,creditshigher,creditslower,stars,color,groupavatar,readaccess,allowvisit,allowpost,allowreply,allowpostpoll,allowdirectpost,allowgetattach,allowpostattach,allowvote,allowmultigroups,allowsearch,allowavatar,allowcstatus,allowuseblog,allowinvisible,allowtransfer,allowsetreadperm,allowsetattachperm,allowhidecode,allowhtml,allowcusbbcode,allownickname,allowsigbbcode,allowsigimgcode,allowviewpro,allowviewstats,disableperiodctrl,reasonpm,maxprice,maxpmnum,maxsigsize,maxattachsize,maxsizeperday,attachextensions,raterange,allowspace,maxspaceattachsize,maxspacephotosize,allowdebate,allowbonus,minbonusprice,maxbonusprice,allowtrade,allowdiggs) VALUES (10,0, 0, 0, '������·', 0, 50, 1, '', '', 10, 1, 1, 1, 0, 0, 1, 1, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 1, 1, 0, 0, 0, 0, 20, 80, 524288, 1048576, '', '', 1, 1048576, 1048576, 0, 0, 0, 0, 0, 1)
;
INSERT INTO usergroups (groupid,admingid,type,system,grouptitle,creditshigher,creditslower,stars,color,groupavatar,readaccess,allowvisit,allowpost,allowreply,allowpostpoll,allowdirectpost,allowgetattach,allowpostattach,allowvote,allowmultigroups,allowsearch,allowavatar,allowcstatus,allowuseblog,allowinvisible,allowtransfer,allowsetreadperm,allowsetattachperm,allowhidecode,allowhtml,allowcusbbcode,allownickname,allowsigbbcode,allowsigimgcode,allowviewpro,allowviewstats,disableperiodctrl,reasonpm,maxprice,maxpmnum,maxsigsize,maxattachsize,maxsizeperday,attachextensions,raterange,allowspace,maxspaceattachsize,maxspacephotosize,allowdebate,allowbonus,minbonusprice,maxbonusprice,allowtrade,allowdiggs) VALUES (11,0, 0, 0, 'ע���Ա', 50, 200, 2, '', '', 20, 1, 1, 1, 1, 1, 1, 1, 1, 0, 2, 1, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 1, 1, 0, 3, 0, 30, 100, 1048576, 2097152, '', '', 1, 2097152, 2097152, 1, 1, 1, 20, 0, 1)
;
INSERT INTO usergroups (groupid,admingid,type,system,grouptitle,creditshigher,creditslower,stars,color,groupavatar,readaccess,allowvisit,allowpost,allowreply,allowpostpoll,allowdirectpost,allowgetattach,allowpostattach,allowvote,allowmultigroups,allowsearch,allowavatar,allowcstatus,allowuseblog,allowinvisible,allowtransfer,allowsetreadperm,allowsetattachperm,allowhidecode,allowhtml,allowcusbbcode,allownickname,allowsigbbcode,allowsigimgcode,allowviewpro,allowviewstats,disableperiodctrl,reasonpm,maxprice,maxpmnum,maxsigsize,maxattachsize,maxsizeperday,attachextensions,raterange,allowspace,maxspaceattachsize,maxspacephotosize,allowdebate,allowbonus,minbonusprice,maxbonusprice,allowtrade,allowdiggs) VALUES (12,0, 0, 0, '�м���Ա', 200, 500, 3, '', '', 30, 1, 1, 1, 1, 1, 1, 1, 1, 0, 2, 2, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 1, 1, 0, 3, 0, 50, 150, 2097152, 4194304, '', '', 1, 4194304, 4194304, 1, 1, 1, 30, 1, 1)
;
INSERT INTO usergroups (groupid,admingid,type,system,grouptitle,creditshigher,creditslower,stars,color,groupavatar,readaccess,allowvisit,allowpost,allowreply,allowpostpoll,allowdirectpost,allowgetattach,allowpostattach,allowvote,allowmultigroups,allowsearch,allowavatar,allowcstatus,allowuseblog,allowinvisible,allowtransfer,allowsetreadperm,allowsetattachperm,allowhidecode,allowhtml,allowcusbbcode,allownickname,allowsigbbcode,allowsigimgcode,allowviewpro,allowviewstats,disableperiodctrl,reasonpm,maxprice,maxpmnum,maxsigsize,maxattachsize,maxsizeperday,attachextensions,raterange,allowspace,maxspaceattachsize,maxspacephotosize,allowdebate,allowbonus,minbonusprice,maxbonusprice,allowtrade,allowdiggs) VALUES (13,0, 0, 0, '�߼���Ա', 500, 1000, 4, '', '', 50, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 3, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 1, 1, 0, 3, 0, 60, 200, 4194304, 8388608, '', '', 1, 8388608, 8388608, 1, 1, 1, 50, 1, 1)
;
INSERT INTO usergroups (groupid,admingid,type,system,grouptitle,creditshigher,creditslower,stars,color,groupavatar,readaccess,allowvisit,allowpost,allowreply,allowpostpoll,allowdirectpost,allowgetattach,allowpostattach,allowvote,allowmultigroups,allowsearch,allowavatar,allowcstatus,allowuseblog,allowinvisible,allowtransfer,allowsetreadperm,allowsetattachperm,allowhidecode,allowhtml,allowcusbbcode,allownickname,allowsigbbcode,allowsigimgcode,allowviewpro,allowviewstats,disableperiodctrl,reasonpm,maxprice,maxpmnum,maxsigsize,maxattachsize,maxsizeperday,attachextensions,raterange,allowspace,maxspaceattachsize,maxspacephotosize,allowdebate,allowbonus,minbonusprice,maxbonusprice,allowtrade,allowdiggs) VALUES (14,0, 0, 0, '���ƻ�Ա', 1000, 3000, 6, '', '', 70, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 3, 0, 0, 0, 0, 1, 1, 1, 0, 1, 0, 1, 1, 1, 1, 0, 3, 20, 80, 300, 4194304, 16777216, '', '', 1, 16777216, 16777216, 1, 1, 1, 60, 1, 1)
;
INSERT INTO usergroups (groupid,admingid,type,system,grouptitle,creditshigher,creditslower,stars,color,groupavatar,readaccess,allowvisit,allowpost,allowreply,allowpostpoll,allowdirectpost,allowgetattach,allowpostattach,allowvote,allowmultigroups,allowsearch,allowavatar,allowcstatus,allowuseblog,allowinvisible,allowtransfer,allowsetreadperm,allowsetattachperm,allowhidecode,allowhtml,allowcusbbcode,allownickname,allowsigbbcode,allowsigimgcode,allowviewpro,allowviewstats,disableperiodctrl,reasonpm,maxprice,maxpmnum,maxsigsize,maxattachsize,maxsizeperday,attachextensions,raterange,allowspace,maxspaceattachsize,maxspacephotosize,allowdebate,allowbonus,minbonusprice,maxbonusprice,allowtrade,allowdiggs) VALUES (15,0, 0, 0, '��̳Ԫ��', 3000, 9999999, 8, '', '', 100, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 3, 0, 0, 0, 0, 1, 1, 1, 0, 1, 0, 1, 1, 1, 1, 0, 3, 0, 100, 500, 4194304, 33554432, '', '', 1, 33554432, 33554432, 1, 1, 1, 70, 1, 1)
;


INSERT INTO onlinelist VALUES (0, 999, '�û�','member.gif')
;
INSERT INTO onlinelist VALUES (1, 1, '����Ա','admin.gif')
;
INSERT INTO onlinelist VALUES (2, 2, '��������','supermoder.gif')
;
INSERT INTO onlinelist VALUES (3, 3, '����','moder.gif')
;
INSERT INTO onlinelist VALUES (4, 4, '��ֹ����','')
;
INSERT INTO onlinelist VALUES (5, 5, '��ֹ����','')
;
INSERT INTO onlinelist VALUES (6, 6, '��ֹ IP','')
;
INSERT INTO onlinelist VALUES (7, 7, '�ο�','guest.gif')
;
INSERT INTO onlinelist VALUES (8, 8, '�ȴ���֤��Ա','')
;
INSERT INTO onlinelist VALUES (9, 9, '��ؤ','')
;
INSERT INTO onlinelist VALUES (10, 10, '������·','')
;
INSERT INTO onlinelist VALUES (11, 11, 'ע���Ա','')
;
INSERT INTO onlinelist VALUES (12, 12, '�м���Ա','')
;
INSERT INTO onlinelist VALUES (13, 13, '�߼���Ա','')
;
INSERT INTO onlinelist VALUES (14, 14, '���ƻ�Ա','')
;
INSERT INTO onlinelist VALUES (15, 15, '��̳Ԫ��','')
;


INSERT INTO admingroups VALUES (1, 1, 1, 3, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
;
INSERT INTO admingroups VALUES (2, 1, 0, 2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)
;
INSERT INTO admingroups VALUES (3, 1, 0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 1, 1)
;


INSERT INTO templates (templateid,directory,name,author,createdate,ver,fordntver,copyright) VALUES(1,'default','Default','LForum','2008-12-30','1.0','1.0','Copyright 2008 LForum For Java')
;
INSERT INTO templates (templateid,directory,name,author,createdate,ver,fordntver,copyright) VALUES(2,'beijing2008','BeiJing2008','LForum','2008-12-30','1.0','1.0','Copyright 2008 LForum For Java')
;
INSERT INTO templates (templateid,directory,name,author,createdate,ver,fordntver,copyright) VALUES(3,'special','Special','LForum','2008-12-30','1.0','1.0','Copyright 2008 LForum For Java')
;

INSERT INTO forumstatistics VALUES (1,0, 0, 1,'',0, 0 ,'1999-01-01',0,0,'')
;


INSERT INTO smilies VALUES (1, 0, 0, 'Ĭ�ϱ���', 'default')
;
INSERT INTO smilies VALUES (2, 0, 1, ':O', 'default/0.gif')
;
INSERT INTO smilies VALUES (3, 0, 1, ':~', 'default/1.gif')
;
INSERT INTO smilies VALUES (4, 0, 1, ':-|', 'default/10.gif')
;
INSERT INTO smilies VALUES (5, 0, 1, ':@', 'default/11.gif')
;
INSERT INTO smilies VALUES (6, 0, 1, ':Z', 'default/12.gif')
;
INSERT INTO smilies VALUES (7, 0, 1, ':D', 'default/13.gif')
;
INSERT INTO smilies VALUES (8, 0, 1, ':)', 'default/14.gif')
;
INSERT INTO smilies VALUES (9, 0, 1, ':(', 'default/15.gif')
;
INSERT INTO smilies VALUES (10, 0, 1, ':+', 'default/16.gif')
;
INSERT INTO smilies VALUES (11, 0, 1, ':#', 'default/17.gif')
;
INSERT INTO smilies VALUES (12, 0, 1, ':Q', 'default/18.gif')
;
INSERT INTO smilies VALUES (13, 0, 1, ':T', 'default/19.gif')
;
INSERT INTO smilies VALUES (14, 0, 1, ':*', 'default/2.gif')
;
INSERT INTO smilies VALUES (15, 0, 1, ':P', 'default/20.gif')
;
INSERT INTO smilies VALUES (16, 0, 1, ':-D', 'default/21.gif')
;
INSERT INTO smilies VALUES (17, 0, 1, ':d', 'default/22.gif')
;
INSERT INTO smilies VALUES (18, 0, 1, ':o', 'default/23.gif')
;
INSERT INTO smilies VALUES (19, 0, 1, ':g', 'default/24.gif')
;
INSERT INTO smilies VALUES (20, 0, 1, ':|-)', 'default/25.gif')
;
INSERT INTO smilies VALUES (21, 0, 1, ':!', 'default/26.gif')
;
INSERT INTO smilies VALUES (22, 0, 1, ':L', 'default/27.gif')
;
INSERT INTO smilies VALUES (23, 0, 1, ':giggle', 'default/28.gif')
;
INSERT INTO smilies VALUES (24, 0, 1, ':smoke', 'default/29.gif')
;
INSERT INTO smilies VALUES (25, 0, 1, ':|', 'default/3.gif')
;
INSERT INTO smilies VALUES (26, 0, 1, ':f', 'default/30.gif')
;
INSERT INTO smilies VALUES (27, 0, 1, ':-S', 'default/31.gif')
;
INSERT INTO smilies VALUES (28, 0, 1, ':?', 'default/32.gif')
;
INSERT INTO smilies VALUES (29, 0, 1, ':x', 'default/33.gif')
;
INSERT INTO smilies VALUES (30, 0, 1, ':yun', 'default/34.gif')
;
INSERT INTO smilies VALUES (31, 0, 1, ':8', 'default/35.gif')
;
INSERT INTO smilies VALUES (32, 0, 1, ':!', 'default/36.gif')
;
INSERT INTO smilies VALUES (33, 0, 1, ':!!!', 'default/37.gif')
;
INSERT INTO smilies VALUES (34, 0, 1, ':xx', 'default/38.gif')
;
INSERT INTO smilies VALUES (35, 0, 1, ':bye', 'default/39.gif')
;
INSERT INTO smilies VALUES (36, 0, 1, ':8-)', 'default/4.gif')
;
INSERT INTO smilies VALUES (37, 0, 1, ':pig', 'default/40.gif')
;
INSERT INTO smilies VALUES (38, 0, 1, ':cat', 'default/41.gif')
;
INSERT INTO smilies VALUES (39, 0, 1, ':dog', 'default/42.gif')
;
INSERT INTO smilies VALUES (40, 0, 1, ':hug', 'default/43.gif')
;
INSERT INTO smilies VALUES (41, 0, 1, ':$$', 'default/44.gif')
;
INSERT INTO smilies VALUES (42, 0, 1, ':(!)', 'default/45.gif')
;
INSERT INTO smilies VALUES (43, 0, 1, ':cup', 'default/46.gif')
;
INSERT INTO smilies VALUES (44, 0, 1, ':cake', 'default/47.gif')
;
INSERT INTO smilies VALUES (45, 0, 1, ':li', 'default/48.gif')
;
INSERT INTO smilies VALUES (46, 0, 1, ':bome', 'default/49.gif')
;
INSERT INTO smilies VALUES (47, 0, 1, ':<', 'default/5.gif')
;
INSERT INTO smilies VALUES (48, 0, 1, ':kn', 'default/50.gif')
;
INSERT INTO smilies VALUES (49, 0, 1, ':football', 'default/51.gif')
;
INSERT INTO smilies VALUES (50, 0, 1, ':music', 'default/52.gif')
;
INSERT INTO smilies VALUES (51, 0, 1, ':shit', 'default/53.gif')
;
INSERT INTO smilies VALUES (52, 0, 1, ':coffee', 'default/54.gif')
;
INSERT INTO smilies VALUES (53, 0, 1, ':eat', 'default/55.gif')
;
INSERT INTO smilies VALUES (54, 0, 1, ':pill', 'default/56.gif')
;
INSERT INTO smilies VALUES (55, 0, 1, ':rose', 'default/57.gif')
;
INSERT INTO smilies VALUES (56, 0, 1, ':fade', 'default/58.gif')
;
INSERT INTO smilies VALUES (57, 0, 1, ':kiss', 'default/59.gif')
;
INSERT INTO smilies VALUES (58, 0, 1, ':$', 'default/6.gif')
;
INSERT INTO smilies VALUES (59, 0, 1, ':heart:', 'default/60.gif')
;
INSERT INTO smilies VALUES (60, 0, 1, ':break:', 'default/61.gif')
;
INSERT INTO smilies VALUES (61, 0, 1, ':metting:', 'default/62.gif')
;
INSERT INTO smilies VALUES (62, 0, 1, ':gift:', 'default/63.gif')
;
INSERT INTO smilies VALUES (63, 0, 1, ':phone:', 'default/64.gif')
;
INSERT INTO smilies VALUES (64, 0, 1, ':time:', 'default/65.gif')
;
INSERT INTO smilies VALUES (65, 0, 1, ':email:', 'default/66.gif')
;
INSERT INTO smilies VALUES (66, 0, 1, ':TV:', 'default/67.gif')
;
INSERT INTO smilies VALUES (67, 0, 1, ':sun:', 'default/68.gif')
;
INSERT INTO smilies VALUES (68, 0, 1, ':moon:', 'default/69.gif')
;
INSERT INTO smilies VALUES (69, 0, 1, ':X', 'default/7.gif')
;
INSERT INTO smilies VALUES (70, 0, 1, ':strong:', 'default/70.gif')
;
INSERT INTO smilies VALUES (71, 0, 1, ':weak:', 'default/71.gif')
;
INSERT INTO smilies VALUES (72, 0, 1, ':share:', 'default/72.gif')
;
INSERT INTO smilies VALUES (73, 0, 1, ':v:', 'default/73.gif')
;
INSERT INTO smilies VALUES (74, 0, 1, ':duoduo:', 'default/74.gif')
;
INSERT INTO smilies VALUES (75, 0, 1, ':MM:', 'default/75.gif')
;
INSERT INTO smilies VALUES (76, 0, 1, ':hh:', 'default/76.gif')
;
INSERT INTO smilies VALUES (77, 0, 1, ':mm:', 'default/77.gif')
;
INSERT INTO smilies VALUES (78, 0, 1, ':beer:', 'default/78.gif')
;
INSERT INTO smilies VALUES (79, 0, 1, ':pesi:', 'default/79.gif')
;
INSERT INTO smilies VALUES (80, 0, 1, ':Zz', 'default/8.gif')
;
INSERT INTO smilies VALUES (81, 0, 1, ':xigua:', 'default/80.gif')
;
INSERT INTO smilies VALUES (82, 0, 1, ':yu:', 'default/81.gif')
;
INSERT INTO smilies VALUES (83, 0, 1, ':duoyun:', 'default/82.gif')
;
INSERT INTO smilies VALUES (84, 0, 1, ':snowman:', 'default/83.gif')
;
INSERT INTO smilies VALUES (86, 0, 1, ':xingxing:', 'default/84.gif')
;
INSERT INTO smilies VALUES (87, 0, 1, ':male:', 'default/85.gif')
;
INSERT INTO smilies VALUES (88, 0, 1, ':female:', 'default/86.gif')
;
INSERT INTO smilies VALUES (89, 0, 1, ':t(', 'default/9.gif')
;
	
	
INSERT INTO bbcodes VALUES (1,1,'flash','flash.gif','flashhttp://localhost/abc.swf/flash',1,1,'��ҳ���в���flashӰƬ','<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=7,0,0,0" width="550" height="400"><param name="allowScriptAccess" value="sameDomain"/><param name="movie" value="{1}"/><param name="quality" value="high"/><param name="bgcolor" value="#ffffff"/><embed src="{1}" quality="high" bgcolor="#ffffff" width="550" height="400" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" /></object>','������flash��ַ','http://')
;
INSERT INTO bbcodes VALUES (2,1,'wmv','wmv.gif','wmv=200,200http://localhost/123.avi/wmv',3,1,'�������м��� Windows Media Player ��ʽ����Ƶ����','<object align=middle classid=CLSID:22d6f312-b0f6-11d0-94ab-0080c74c7e95 class=OBJECT id=MediaPlayer width={2} height={3}><param name=ShowStatusBar value=-1><param name=Filename value={1}><embed type=application/x-oleobject codebase=http://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=5,1,52,701 flename=mp src={1}  width={2} height={3}></embed></object>','������Windows Media Player��Ƶ�ļ���ַ,������Windows Media Player��Ƶ�ļ�����ʾ���,������Windows Media Player��Ƶ�ļ�����ʾ�߶�','http://,200,200')
;
INSERT INTO bbcodes VALUES (3,1,'wma','wma.gif','wmahttp://localhost/123.mp3/wma',1,1,'�������м��� Windows Media Player ��ʽ����Ƶ����','<object classid="CLSID:6BF52A52-394A-11d3-B153-00C04F79FAA6" width="260" height="64"><param name="autostart" value="0" /><param name="url" value="{1}" /><embed src="{1}" autostart="0" type="video/x-ms-wmv" width="260" height="42"></embed></object>','������ Windows Media Player ��Ƶ�ĵ�ַ','http://')
;
INSERT INTO bbcodes VALUES (4,1,'rm','rm.gif','rm=200,200http://localhost/123.rm/rm',3,1,'�������в���RealPlayer��Ƶ','<object classid="clsid:CFCDAA03-8BE4-11cf-B84B-0020AFBBCCFA" width="{2}" height="{3}"><param name="src" value="{1}" /><param name="controls" value="imagewindow" /><param name="console" value="{1}" /><embed src="{1}" type="audio/x-pn-realaudio-plugin" controls="IMAGEWINDOW" console="{1}" width="{2}" height="360"></embed></object><br style="height:0" /><object classid="CLSID:CFCDAA03-8BE4-11CF-B84B-0020AFBBCCFA" width="{2}" height="32"><param name="src" value="{1}" /><param name="controls" value="controlpanel" /><param name="console" value="{1}" /><embed src="{1}" type="audio/x-pn-realaudio-plugin" controls="ControlPanel" console="{1}" width="{2}" height="32"></embed></object>','������RealPlayer��Ƶ�ĵ�ַ,������RealPlayer��Ƶ�Ŀ��,������RealPlayer��Ƶ�ĸ߶�','http://,200,200')
;
INSERT INTO bbcodes VALUES (5,1,'ra','ra.gif','rahttp://localhost/123.ra/ra',1,1,'�������в���RealPlayer��Ƶ','<object classid="clsid:CFCDAA03-8BE4-11CF-B84B-0020AFBBCCFA" width="400" height="30"><param name="src" value="{1}" /><param name="controls" value="controlpanel" /><param name="console" value="{1}" /><embed src="{1}" type="audio/x-pn-realaudio-plugin" console="{1}" controls="ControlPanel" width="400" height="30"></embed></object>','������RealPlayer��Ƶ��ַ','http://')
;
INSERT INTO bbcodes VALUES (6,1,'fly','fly.gif','flyʾ������/fly',1,1,'�������в����������','<marquee width="90%" behavior="alternate" scrollamount="3">{1}</marquee>','�������������','��������')
;
INSERT INTO bbcodes VALUES (7,1,'silverlight','silverlight.gif','silverlighthttp://localhost/123.wmv/silverlight',3,1,'��������ʹ��Silverlight������', '<script type="text/javascript" src="silverlight/player/showtopiccontainer.js"></script><div id="divPlayer_{RANDOM}"></div><script>Silverlight.InstallAndCreateSilverlight("1.0",document.getElementById("divPlayer_{RANDOM}"),installExperienceHTML,"InstallPromptDiv",function(){new StartPlayer_0("divPlayer_{RANDOM}", parseInt("{2}"), parseInt("{3}"), "{1}", forumpath)})</script>', '��������Ƶ����Ƶ�ĵ�ַ,��������Ƶ����Ƶ�Ŀ��,��������Ƶ�ĸ߶�(��Ƶ��Ч)', 'http://,400,300')
;


INSERT INTO topicidentify VALUES (1,'�ҳ���', 'zc.gif')
;
INSERT INTO topicidentify VALUES (2,'��̬��', 'bt.gif')
;
INSERT INTO topicidentify VALUES (3,'������', 'cj.gif')
;
INSERT INTO topicidentify VALUES (4,'��ҫ��', 'xy.gif')
;
INSERT INTO topicidentify VALUES (5,'������', 'cz.gif')
;
INSERT INTO topicidentify VALUES (6,'ί����', 'ws.gif')
;
INSERT INTO topicidentify VALUES (7,'������', 'hx.gif')
;
INSERT INTO topicidentify VALUES (8,'������', 'jc.gif')
;
INSERT INTO topicidentify VALUES (9,'������', 'wl.gif')
;
INSERT INTO topicidentify VALUES (10,'������', 'wq.gif')
;
INSERT INTO topicidentify VALUES (11,'XX��', 'xx.gif')
;
INSERT INTO topicidentify VALUES (12,'������', 'gf.gif')
;
INSERT INTO topicidentify VALUES (13,'������', 'lj.gif')
;
INSERT INTO topicidentify VALUES (14,'�Ƽ���', 'tj.gif')
;
INSERT INTO topicidentify VALUES (15,'��Ц��', 'gx.gif')
;
INSERT INTO topicidentify VALUES (16,'������', 'bq.gif')
;
INSERT INTO topicidentify VALUES (17,'ţ��', 'nb.gif')
;


INSERT INTO attachtypes VALUES (1,'jpg',2048000)
;
INSERT INTO attachtypes VALUES (2,'gif',1024000)
;
INSERT INTO attachtypes VALUES (3,'png',2048000)
;
INSERT INTO attachtypes VALUES (4,'zip',2048000)
;
INSERT INTO attachtypes VALUES (5,'rar',2048000)
;
INSERT INTO attachtypes VALUES (6,'jpeg',2048000)
;


INSERT INTO help VALUES (1,'�û���֪', '', 0, 1)
;
INSERT INTO help VALUES (2,'��̳��������', '', 0, 2)
;
INSERT INTO help VALUES (5,'�ұ���Ҫע����', '��ȡ���ڹ���Ա������� LForum ��̳���û���Ȩ��ѡ��������п��ܱ�����ע�����ʽ�û�������������ӡ���Ȼ����ͨ������£�������Ӧ������ʽ�û����ܷ������ͻظ��������ӡ��� <a href="register.action" target="_blank">�������</a> ���ע���Ϊ���ǵ����û���<br /><br />ǿ�ҽ�����ע�ᣬ������õ��ܶ����ο�����޷�ʵ�ֵĹ��ܡ�', 1, 1)
;
INSERT INTO help VALUES (6,'����ε�¼��̳��', '������Ѿ�ע���Ϊ����̳�Ļ�Ա����ô��ֻҪͨ������ҳ�����ϵ�<a href="login.action" target="_blank">��¼</a>�������½������д��ȷ���û��������루��������а�ȫ���ʣ���ѡ����ȷ�İ�ȫ���ʲ������Ӧ�Ĵ𰸣���������ύ��������ɵ�½�������δע���������<br /><br />�����Ҫ���ֵ�¼����ѡ����Ӧ�� Cookie ʱ�䣬�ڴ�ʱ�䷶Χ�������Բ�����������������ϴεĵ�¼״̬��', 1, 2)
;
INSERT INTO help VALUES (7,'�����ҵĵ�¼���룬��ô�죿', '�����������û���¼�����룬������ͨ��ע��ʱ��д�ĵ���������������һ���µ����롣�����¼ҳ���е� <a href="getpassword.action" target="_blank">ȡ������</a>������Ҫ����д���ĸ�����Ϣ��ϵͳ���Զ���������������ʼ�����ע��ʱ��д�� Email �����С�������� Email ��ʧЧ���޷��յ��ż���������̳����Ա��ϵ��', 1, 3)
;
INSERT INTO help VALUES (8,'�����ʹ�ø��Ի�ͷ��', '��<a href="usercppreference.action" target="_blank">�û�����</a>�е� ��������  -> �������ã�����ʹ����̳�Դ���ͷ������Զ����ͷ��', 1, 4)
;
INSERT INTO help VALUES (9,'������޸ĵ�¼����', '��<a href="usercpnewpassword.action" target="_blank">�û�����</a>�е� �������� -> �������룬��д��ԭ���롱���������롱����ȷ�������롱��������ύ���������޸ġ�', 1, 5)
;
INSERT INTO help VALUES (10,'�����ʹ�ø��Ի�ǩ�����ǳ�', '��<a href="usercpprofile.action" target="_blank">�û�����</a>�е� �������� -> �༭���˵�������һ�����ǳơ��͡�����ǩ������ѡ������ڴ����á�', 1, 6)
;
INSERT INTO help VALUES (11,'����η��������⣬�Լ�ͶƱ', '����̳����У��㡰��������������ɽ��빦����ȫ�ķ������档<br /><br />ע�⣺��Ҫ����ͶƱʱ���ڷ���������·�����ͶƱѡ��������ü��ɡ��緢����ͨ���⣬ֱ�ӵ��������������Ȼ��Ҳ����ʹ�ð������ġ����ٷ�������������(�����ѡ���)��һ����̳������Ϊ��Ҫ��¼����ܷ�����', 2, 1)
;
INSERT INTO help VALUES (12,'����η���ظ�', '�ظ��з����֣���һ���������·��Ŀ��ٻظ��� �ڶ���������ظ���¥�������·����ظ����� �����������ظ�ҳ�棬�����ҳ���������Աߵġ��ظ�����', 2, 2)
;
INSERT INTO help VALUES (13,'����α༭�Լ�������', '�����ӵ����Ͻǣ��б༭���ظ��������ѡ�����༭���Ϳ��Զ����ӽ��б༭��', 2, 3)
;
INSERT INTO help VALUES (14,'����γ��۹�������', '<li>�������⣺�������뷢���������������ڵ��û����з���������Ȩ�ޣ��ڡ��ۼ�(��Ǯ)��������д����ļ۸����������û��ڲ鿴������ӵ�ʱ�����Ҫ���뽻�ѵĹ��̲ſ��Բ鿴���ӡ�</li><li>�������⣺�����׼����������ӣ������ӵ������Ϣ�������в鿴�����¼ �������� ������һҳ �����ӣ�������������⡱���й���</li>', 2, 4)
;
INSERT INTO help VALUES (15,'������ϴ�����', '<li>�����������ʱ���ϴ�����������Ϊ��д�����ӱ�������ݺ���ϴ������ҷ��������Ȼ���ڱ���ѡ��Ҫ�ϴ������ľ����ļ���������������⡣</li><li>����ظ���ʱ���ϴ�����������Ϊ��д��ظ�¥�������ݣ�Ȼ����ϴ������ҷ���������ҵ���Ҫ�ϴ��ĸ������������ظ���</li>', 2, 5)
;
INSERT INTO help VALUES (16,'�����ʵ�ַ���ʱͼ�Ļ���Ч��', '<li>�����������ʱ�����ϴ��������ġ����롱���ӰѸ�����ǲ��뵽�������ʵ���λ�ü��ɡ�</li>', 2, 6)
;
INSERT INTO help VALUES (17,'�����ʹ��LForum����', '<table width="99%" cellpadding="2" cellspacing="2"><tr><th width="50%">LForum����</th><th width="402">Ч��</th></tr><tr><td>b�������� Abc/b</td><td><strong>�������� Abc</strong></td></tr><tr><td>iб������ Abc/i</td><td><i>б������ Abc</i></td></tr><tr><td>u�»������� Abc/u</td><td><u>�»������� Abc</u></td></tr><tr><td>color=red����ɫ/color</td><td><font color="red">����ɫ</font></td></tr><tr><td>size=3���ִ�СΪ 3/size </td><td><font size="3">���ִ�СΪ 3</font></td></tr><tr><td>font=��������Ϊ����/font </td><td><font face="����">����Ϊ����</font></td></tr><tr><td>align=Center���ݾ���/align </td><td><div align="center">���ݾ���</div></td></tr><tr><td>urlhttp://lonlysky.javaeye.com/url</td><td><a href="http://lonlysky.javaeye.com" target="_blank">http://lonlysky.javaeye.com</a>���������ӣ�</td></tr><tr><td>url=http://lonlysky.javaeye.comLForum ��̳/url</td><td><a href="http://lonlysky.javaeye.com" target="_blank">LForum ��̳</a>���������ӣ�</td></tr><tr><td>emailmyname@mydomain.com/email</td><td><a href="mailto:myname@mydomain.com">myname@mydomain.com</a>��E-mail���ӣ�</td></tr><tr><td>email=huangking124@163.comLForum ����֧��/email</td><td><a href="mailto:huangking124@163.com">LForum ����֧�֣�E-mail���ӣ�</a></td></tr><tr><td>quoteLForum Board ����Lonlysky��������̳���/quote </td><td><div style="font-size: 12px"><br /><br /><div class="quote"><h5>����:</h5><blockquote>ԭ���� <i>admin</i> �� 2006-12-26 08:45 ����<br />LForum Board ����Lonlysky��������̳���</blockquote></div></td></tr> <tr><td>codeLForum Board ����Lonlysky��������̳���/code </td><td><div style="font-size: 12px"><br /><br /><div class="blockcode"><h5>����:</h5><code id="code0">LForum Board ����Lonlysky��������̳���</code></div></td></tr><tr><td>hide�������� Abc/hide</td><td>Ч��:ֻ�е�����߻ظ�����ʱ������ʾ���е����ݣ�������ʾΪ��<b>**** ������Ϣ �����������ʾ *****</b>��</td></tr><tr><td>list*�б��� #1*�б��� #2*�б��� #3/list</td><td><ul><li>�б��� ��1</li><li>�б��� ��2</li><li>�б��� ��3 </li></ul></td></tr><tr><td>imgtemplates/default/images/clogo.gif/img </td><td>��������ʾΪ��<img src="templates/default/images/clogo.gif" /></td></tr><tr><td>img=88,31templates/default/images/clogo.gif/img </td><td>��������ʾΪ��<img src="templates/default/images/clogo.gif" /></td> </tr> <tr><td>fly���е�Ч��/fly</td><td><marquee scrollamount="3" behavior="alternate" width="90%">���е�Ч��</marquee></td></tr><tr><td>flashFlash��ҳ��ַ /flash </td><td>������Ƕ�� Flash ����</td></tr><tr><td>Xsup2/sup</td><td>X<sup>2</sup></td></tr><tr><td>Xsub2/sub</td><td>X<sub>2</sub></td></tr></table>', 2, 7)
;
INSERT INTO help VALUES (18,'�����ʹ�ö���Ϣ����', '����¼�󣬵���������ϵĶ���Ϣ��ť�����ɽ������Ϣ����������Ͷ���Ϣ��ť����"���͵�"�����������˵��û�������д���������ݣ����ύ(�� Ctrl+Enter ����)���ɷ�������Ϣ��<br /><br />���Ҫ���浽�����䣬�����ύǰ��ѡ"���浽��������"ǰ�ĸ�ѡ��<ul><li>����ռ���ɴ������ռ���鿴�յ��Ķ���Ϣ��</li><li>���������ɲ鿴�����ڷ�������Ķ���Ϣ�� </li></ul>', 2, 8)
;
INSERT INTO help VALUES (19,'����β鿴��̳��Ա����', '�������������Ļ�Ա��Ȼ����ʾ���Ǵ���̳�Ļ�Ա���ݡ�ע����Ҫ��̳����Ա����������鿴��Ա���ϲſɿ�����', 2, 9)
;
INSERT INTO help VALUES (20,'�����ʹ������', '�����������������������������Ĺؼ��ֲ�ѡ��һ����Χ���Ϳ��Լ���������Ȩ�޷�����̳�е���ص����ӡ�', 2, 10)
;
INSERT INTO help VALUES (21,'�����ʹ�á��ҵġ�����', '<li>��Ա��������<a href="login.action" target="_blank">��¼</a>��û���û���������<a href="register.action" target="_blank">ע��</a>��</li><li>��¼֮������̳�����Ϸ������һ�����ҵġ��ĳ������ӣ�����������֮��Ϳɽ��뵽�й���������Ϣ��</li>', 2, 11)
;
INSERT INTO help VALUES (22,'����������Ա�ٱ�����', '��һ�����ӣ������ӵ����Ͻǿ��Կ�����"�ٱ��� | "���͡� | "�ղ�" | "�༭" | "ɾ��" |"����" �ȵȼ�����ť���������ٱ�����ť������ɾٱ�ĳ�����ӵĲ�����', 2, 12)
;
INSERT INTO help VALUES (23,'����Ρ��ղء�����', '�������һ������ʱ�����������Ͻǿ��Կ�����"�ٱ��� | "���͡� | "�ղ�" | "�༭" | "ɾ��" |"����"��������Ӧ���������Ӽ��������صĲ�����', 2, 13)
;
INSERT INTO help VALUES (24,'�����ʹ��RSS����', '����̳����ҳ�ͽ������ҳ������ϽǾͻ����һ��rss���ĵ�Сͼ��<img src="templates/default/images/rss.gif" border="0">�������֮�󽫳��ֱ�վ���rss��ַ������Խ���rss��ַ���뵽���rss�Ķ����н��ж��ġ�', 2, 14)
;
INSERT INTO help VALUES (25,'��������Cookies', '����3�ֳ����������Cookies�������(ע���˷���Ϊ���ȫ����Cookies,�����ʹ��)<ul><li>Internet Explorer: ���ߣ�ѡ��ڵ�Internetѡ�������ѡ��ڣ�IE6ֱ�ӿ��Կ���ɾ��Cookies�İ�ť������ɣ�IE7Ϊ��� ����ʷ��¼��ѡ���ڵ�ɾ������������Cookies������Maxthon,��ѶTT��IE���������һ�����á� </li><li>FireFox:���ߡ�ѡ�����˽��Cookies����ʾCookie����Զ�Cookie���ж�Ӧ��ɾ�������� </li><li>Opera:���ߡ���ѡ����߼���Cookies������Cookies���ɶ�Cookies����ɾ���Ĳ�����</li></ul>', 2, 15)
;
INSERT INTO help VALUES (26,'�����ʹ�ñ������', '������һЩ���ַ���ʾ�ı�����ţ�����򿪱��鹦�ܣ�LForum ���һЩ����ת����Сͼ����ʾ�������У������������ˡ�ͬʱLForum֧�ֱ�����࣬��ҳ���ܡ��������ʱֻ��ʹ����������鼴�ɡ�', 2, 16)
;
	
	
INSERT INTO medals VALUES (1,'Medal No.1',1,'Medal1.gif')
;
INSERT INTO medals VALUES (2,'Medal No.2',1,'Medal2.gif')
;	
INSERT INTO medals VALUES (3,'Medal No.3',1,'Medal3.gif')
;	
INSERT INTO medals VALUES (4,'Medal No.4',1,'Medal4.gif')
;	
INSERT INTO medals VALUES (5,'Medal No.5',1,'Medal5.gif')
;	
INSERT INTO medals VALUES (6,'Medal No.6',1,'Medal6.gif')
;	
INSERT INTO medals VALUES (7,'Medal No.7',1,'Medal7.gif')
;	
INSERT INTO medals VALUES (8,'Medal No.8',1,'Medal8.gif')
;	
INSERT INTO medals VALUES (9,'Medal No.9',1,'Medal9.gif')
;	
INSERT INTO medals VALUES (10,'Medal No.10',1,'Medal10.gif')
;	
INSERT INTO medals VALUES (11,'Medal No.11',0,'')
;	
INSERT INTO medals VALUES (12,'Medal No.12',0,'')
;	
INSERT INTO medals VALUES (13,'Medal No.13',0,'')
;	
INSERT INTO medals VALUES (14,'Medal No.14',0,'')
;	
INSERT INTO medals VALUES (15,'Medal No.15',0,'')
;	
INSERT INTO medals VALUES (16,'Medal No.16',0,'')
;	
INSERT INTO medals VALUES (17,'Medal No.17',0,'')
;	
INSERT INTO medals VALUES (18,'Medal No.18',0,'')
;	
INSERT INTO medals VALUES (19,'Medal No.19',0,'')
;	
INSERT INTO medals VALUES (20,'Medal No.20',0,'')
;	
INSERT INTO medals VALUES (21,'Medal No.21',0,'')
;	
INSERT INTO medals VALUES (22,'Medal No.22',0,'')
;	
INSERT INTO medals VALUES (23,'Medal No.23',0,'')
;	
INSERT INTO medals VALUES (24,'Medal No.24',0,'')
;	
INSERT INTO medals VALUES (25,'Medal No.25',0,'')
;	
INSERT INTO medals VALUES (26,'Medal No.26',0,'')
;	
INSERT INTO medals VALUES (27,'Medal No.27',0,'')
;	
INSERT INTO medals VALUES (28,'Medal No.28',0,'')
;	
INSERT INTO medals VALUES (29,'Medal No.29',0,'')
;	
INSERT INTO medals VALUES (30,'Medal No.30',0,'')
;	
INSERT INTO medals VALUES (31,'Medal No.31',0,'')
;	
INSERT INTO medals VALUES (32,'Medal No.32',0,'')
;	
INSERT INTO medals VALUES (33,'Medal No.33',0,'')
;	
INSERT INTO medals VALUES (34,'Medal No.34',0,'')
;	
INSERT INTO medals VALUES (35,'Medal No.35',0,'')
;	
INSERT INTO medals VALUES (36,'Medal No.36',0,'')
;	
INSERT INTO medals VALUES (37,'Medal No.37',0,'')
;	
INSERT INTO medals VALUES (38,'Medal No.38',0,'')
;	
INSERT INTO medals VALUES (39,'Medal No.39',0,'')
;	
INSERT INTO medals VALUES (40,'Medal No.40',0,'')
;	
INSERT INTO medals VALUES (41,'Medal No.41',0,'')
;	
INSERT INTO medals VALUES (42,'Medal No.42',0,'')
;	
INSERT INTO medals VALUES (43,'Medal No.43',0,'')
;	
INSERT INTO medals VALUES (44,'Medal No.44',0,'')
;	
INSERT INTO medals VALUES (45,'Medal No.45',0,'')
;	
INSERT INTO medals VALUES (46,'Medal No.46',0,'')
;	
INSERT INTO medals VALUES (47,'Medal No.47',0,'')
;	
INSERT INTO medals VALUES (48,'Medal No.48',0,'')
;	
INSERT INTO medals VALUES (49,'Medal No.49',0,'')
;	
INSERT INTO medals VALUES (50,'Medal No.50',0,'')
;	
INSERT INTO medals VALUES (51,'Medal No.51',0,'')
;
INSERT INTO medals VALUES (52,'Medal No.52',0,'')
;	
INSERT INTO medals VALUES (53,'Medal No.53',0,'')
;	
INSERT INTO medals VALUES (54,'Medal No.54',0,'')
;	
INSERT INTO medals VALUES (55,'Medal No.55',0,'')
;	
INSERT INTO medals VALUES (56,'Medal No.56',0,'')
;	
INSERT INTO medals VALUES (57,'Medal No.57',0,'')
;	
INSERT INTO medals VALUES (58,'Medal No.58',0,'')
;	
INSERT INTO medals VALUES (59,'Medal No.59',0,'')
;	
INSERT INTO medals VALUES (60,'Medal No.60',0,'')
;	
INSERT INTO medals VALUES (61,'Medal No.61',0,'')
;	
INSERT INTO medals VALUES (62,'Medal No.62',0,'')
;	
INSERT INTO medals VALUES (63,'Medal No.63',0,'')
;	
INSERT INTO medals VALUES (64,'Medal No.64',0,'')
;	
INSERT INTO medals VALUES (65,'Medal No.65',0,'')
;	
INSERT INTO medals VALUES (66,'Medal No.66',0,'')
;	
INSERT INTO medals VALUES (67,'Medal No.67',0,'')
;	
INSERT INTO medals VALUES (68,'Medal No.68',0,'')
;	
INSERT INTO medals VALUES (69,'Medal No.69',0,'')
;	
INSERT INTO medals VALUES (70,'Medal No.70',0,'')
;	
INSERT INTO medals VALUES (71,'Medal No.71',0,'')
;	
INSERT INTO medals VALUES (72,'Medal No.72',0,'')
;	
INSERT INTO medals VALUES (73,'Medal No.73',0,'')
;	
INSERT INTO medals VALUES (74,'Medal No.74',0,'')
;	
INSERT INTO medals VALUES (75,'Medal No.75',0,'')
;	
INSERT INTO medals VALUES (76,'Medal No.76',0,'')
;	
INSERT INTO medals VALUES (77,'Medal No.77',0,'')
;	
INSERT INTO medals VALUES (78,'Medal No.78',0,'')
;	
INSERT INTO medals VALUES (79,'Medal No.79',0,'')
;	
INSERT INTO medals VALUES (80,'Medal No.80',0,'')
;	
INSERT INTO medals VALUES (81,'Medal No.81',0,'')
;	
INSERT INTO medals VALUES (82,'Medal No.82',0,'')
;	
INSERT INTO medals VALUES (83,'Medal No.83',0,'')
;	
INSERT INTO medals VALUES (84,'Medal No.84',0,'')
;	
INSERT INTO medals VALUES (85,'Medal No.85',0,'')
;	
INSERT INTO medals VALUES (86,'Medal No.86',0,'')
;	
INSERT INTO medals VALUES (87,'Medal No.87',0,'')
;	
INSERT INTO medals VALUES (88,'Medal No.88',0,'')
;	
INSERT INTO medals VALUES (89,'Medal No.89',0,'')
;	
INSERT INTO medals VALUES (90,'Medal No.90',0,'')
;	
INSERT INTO medals VALUES (91,'Medal No.91',0,'')
;	
INSERT INTO medals VALUES (92,'Medal No.92',0,'')
;	
INSERT INTO medals VALUES (93,'Medal No.93',0,'')
;	
INSERT INTO medals VALUES (94,'Medal No.94',0,'')
;	
INSERT INTO medals VALUES (95,'Medal No.95',0,'')
;	
INSERT INTO medals VALUES (96,'Medal No.96',0,'')
;	
INSERT INTO medals VALUES (97,'Medal No.97',0,'')
;	
INSERT INTO medals VALUES (98,'Medal No.98',0,'')
;	
INSERT INTO medals VALUES (99,'Medal No.99',0,'')
;


INSERT INTO tablelist VALUES (1,'2008-12-30','posts',1,0)
;

INSERT INTO forumlinks VALUES ( 1,1, 'LForum', 'http://lonlysky.javaeye.com', '��į������JAVA����', 'images/logo.gif')
;
