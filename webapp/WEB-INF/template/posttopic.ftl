<#-- 
	描述：发表主题模板
	作者：黄磊 
	版本：v1.0 
-->
<#import "inc/page_comm.ftl" as comm />
<@comm.header/>
<script type="text/javascript" src="javascript/ajax.js"></script>
<script type="text/javascript">
var postminchars = parseInt('${config.minpostsize.toString()}');
var postmaxchars = parseInt('${config.maxpostsize.toString()}');
var disablepostctrl = parseInt('${disablepost.toString()}');
</script>
<div id="foruminfo">
	<div id="nav">
		<a href="${config.forumurl}">${config.forumtitle}</a> &raquo; ${forumnav}  &raquo; 
			<#if type=="bonus">
				发表新悬赏
			<#elseif type=="poll">
				发表新投票
			<#elseif type=="debate">
				发起新辩论
			<#else>
				发表新主题
			</#if>
	</div>
</div>
<#if reqcfg.page_err==0>
<#if ispost>
<@comm.msgbox />
<script type="text/javascript">setcookie("title", '', 1);</script>
<#else>
	<div class="mainbox viewthread" id="previewtable" style="display: none">
			<h1>预览帖子</h1>
			<table summary="预览帖子" cellspacing="0" cellpadding="0">
				<tr>
					<td class="postauthor">${username}</td>
					<td class="postcontent">
						<span class="fontfamily">${nowdatetime}</span>
						<span id="previewmessage"></span>
					</td>
				</tr>
			</table>
	</div>
	<form method="post" name="postform" id="postform" action="" enctype="multipart/form-data" onsubmit="return validate(this);">
	<div class="mainbox formbox">
		<h1>
		<#if type=="bonus">
			发表新悬赏
		<#elseif type=="poll">
			发表新投票
		<#elseif type=="debate">
			发起新辩论
		<#else>
			发表新主题
		</#if>
		</h1>
		<table summary="post" cellspacing="0" cellpadding="0" id="newpost">
			<@comm.tempaccounts />
			<tbody>
			<tr>
				<th><label for="title">标题</label></th>
				<td>
					<#if forum.forumfields.applytopictype==1 && topictypeselectoptions!="">
						<select name="typeid" id="typeid">${topictypeselectoptions}</select>
					</#if>
					<input name="title" type="text" id="title" size="60" title="标题最多为60个字符" />
					<#if canhtmltitle>
					<a id="titleEditorButton" href="###" onclick="">高级编辑</a>
					<script type="text/javascript" src="javascript/dnteditor.js"></script>
					<div id="titleEditorDiv" style="display: none;">
					<textarea name="htmltitle" id="htmltitle" cols="80" rows="10"></textarea>
					<script type="text/javascript">
						var forumpath = '${forumpath}';
						var templatepath = '${templatepath}';
						var temptitle = $('faketitle');
						var titleEditor = null;
						function AdvancedTitleEditor() {
							$('title').style.display = 'none';
							$('titleEditorDiv').style.display = '';
							$('titleEditorButton').style.display = 'none';

							titleEditor = new DNTeditor('htmltitle', '500', '50', $('title').value);
							titleEditor.OnChange = function(){
								//temptitle.innerHTML = html2bbcode(titleEditor.GetHtml().replace(/<[^>]*>/ig, ''));
							}
							titleEditor.Basic = true;
							titleEditor.IsAutoSave = false;
							titleEditor.Style = forumpath + 'templates/' + templatepath + '/editor.css';
							titleEditor.BasePath = forumpath;
							titleEditor.ReplaceTextarea();
						}

						$('titleEditorButton').onclick = function(){
							AdvancedTitleEditor();
						};

					</script>
					</div>
					</#if>
				</td>
			</tr>
			</tbody>
			<#if type=="bonus">
			<tbody>
				<tr>
					<th><input id="isbonus" type="hidden" name="isbonus" value="1" />悬赏价格</th>
					<td>
					<input name="topicprice" type="text" id="topicprice" value="${usergroupinfo.minbonusprice}" size="5" />
					${userextcreditsinfo.unit}
				${userextcreditsinfo.name}[ 悬赏范围 ${usergroupinfo.minbonusprice} - ${usergroupinfo.maxbonusprice}  
						${userextcreditsinfo.unit}
					${userextcreditsinfo.name}, 当前可用 ${mycurrenttranscredits} ${userextcreditsinfo.unit}${userextcreditsinfo.name}
			 ](只允许正整数)
					</td>
				</tr>
			</tbody>
			</#if>
			<#if usergroupinfo.allowpostpoll==1&&type=="poll">
			<tbody>
			<tr>
				<th><label for="enddatetime">投票结束日期</label></th>
				<td>
					<input name="enddatetime" type="text" id="enddatetime" size="10" value="${enddatetime}" style="cursor:default" onClick="showcalendar(event, 'enddatetime', 'cal_startdate', 'cal_enddate', '${enddatetime}');" readonly="readonly" /></span>
				<input type="hidden" name="cal_startdate" id="cal_startdate" size="10"  value="${enddatetime}">
				<input type="hidden" name="cal_enddate" id="cal_enddate" size="10"  value="">
				 </td>
			</tr>
			</tbody> 
			<tbody>
			<tr>
				<th>
					<input name="createpoll" type="hidden" id="createpoll" value="1" />
                   		 	<input type="checkbox" name="visiblepoll"  /> 提交投票后结果才可见<br />
                    			<input type="checkbox" name="multiple"  onclick="this.checked?$('maxchoicescontrol').style.display='':$('maxchoicescontrol').style.display='none';" class="checkinput" /> 多选投票<br />
           	        		<span id="maxchoicescontrol" style="display: none">最多可选项数: <input type="text" name="maxchoices" value="2" size="5"><br /></span>
				</th>
				<td>
					<input name="button" type="button" onclick="clonePoll('${config.maxpolloptions}')" value="增加投票项" />
					<input name="button" type="button" onclick="if(!delObj(document.getElementById('polloptions'),2)){alert('投票项不能少于2个');}" value="删除投票项" />
					<input id="PollItemname" type="hidden" name="PollItemname" value="" />
					<input id="PollItemvalue" type="hidden" name="PollItemvalue" value="" />
					<div id="polloptions">
						<div id="divPollItem"><input type="text" size="70" id="pollitemid" name="pollitemid" maxlength="80" /></div>
						<div><input type="text" size="70" id="pollitemid" name="pollitemid" maxlength="80" /></div>
					</div>
				 </td>
			</tr>
			</tbody>
			</#if>     
			<tbody>
				<@comm.editor/>
			</tbody>
			<#if type=="debate">
			<tbody>
				<tr>
					<th><label for="positiveopinion">正方观点</label></th>
					<td><input name="positiveopinion" type="text" id="positiveopinion" style="margin-bottom:-1px;" value="" size="80" maxlength="200" />
					(最多 200 字)</td>
				</tr>
				<tr>
					<th><label for="negativeopinion">反方观点</label></th>
					<td><input name="negativeopinion" type="text" id="negativeopinion" style="margin-bottom:-1px;" value="" size="80" maxlength="200" />
					(最多 200 字)</td>
				</tr>
				<tr>
					<th><label for="terminaltime">结束时间</label></th>
					<td><input type="text" name="terminaltime" id="terminaltime" style="margin-bottom:-1px;cursor:pointer;" size="16" value="${enddatetime}" onclick="showcalendar(event, 'terminaltime', 'cal_startdate', 'cal_enddate', '{enddatetime}');" readonly />(日期格式 年-月-日, 如 2008-8-8)
					<input type="hidden" name="cal_startdate" id="cal_startdate" value="${enddatetime}">
					<input type="hidden" name="cal_enddate" id="cal_enddate" value="">
					</td>
				</tr>
			</tbody>
			<script type="text/javascript">
				function doadvdebate()
				{
					var adv_open = $('advdebate_open');
					var adv_close = $('advdebate_close');
					if (adv_open && adv_close)
					{
						if (adv_open.style.display != 'none')
						{
							adv_open.style.display = 'none';
							adv_close.style.display = '';
						}
						else
						{
							adv_open.style.display = '';
							adv_close.style.display = 'none';
						}
					}
				}
			</script>
		</#if>
		<#if enabletag>
			<tbody>
				<tr>
					<th><label for="positiveopinion">标签(Tags)</label></th>
					<td><input type="text" name="tags" id="tags" value="" style="margin-bottom:-1px;" size="55" />&nbsp;<input type="button" onclick="relatekw();" value="可用标签"/>  (用空格隔开多个标签，最多可填写 5 个)</td>
				</tr>
			</tbody>
		</#if>
			<tbody class="divoption">
				<tr>
					<th>&nbsp;</th>					
					<td><a href="###" id="advoption" onclick="expandoptions('divAdvOption');">其他选项<img src="templates/${templatepath}/images/dot-down2.gif" /></a></td>	
				</tr>
			</tbody>
			<tbody  id="divAdvOption" style="display:none">
			<#if userid!=-1 && usergroupinfo.allowsetreadperm==1>
				<tr>
					<th><label for="topicreadperm">阅读权限</label></th>
					<td>
						<input name="topicreadperm" type="text" id="topicreadperm" value="0" size="5" />(阅读权限的最大有效值为 255)
					</td>
				</tr>
			</#if>
			<#if type=="">
				<#if creditstrans!=0 && (maxprice>0)>
				<tr>
					<th><label for="positiveopinion">售价</label></th>
					<td>
					<input name="topicprice" type="text" id="topicprice" value="0" size="5" />
				${userextcreditsinfo.unit}
				${userextcreditsinfo.name}
				&nbsp;&nbsp;[ 主题最高售价 ${maxprice} 
				${userextcreditsinfo.unit}
				${userextcreditsinfo.name}
		 ](售价只允许非负整数, 单个主题最大收入 ${scoresetManager.getMaxIncPerTopic()} ${userextcreditsinfo.unit}${userextcreditsinfo.name}
					</td>
				</tr>
				</#if>
				<tr>
					<th><label for="title">图标</label></th>
					<td>
						<input name="iconid" type="radio" value="0" checked /> 无&nbsp;
						<input type="radio" name="iconid" value="1" />
						<img src="images/posticons/1.gif" alt="求助"/>
						<input type="radio" name="iconid" value="2" />
						<img src="images/posticons/2.gif" alt="示好"/>
						<input type="radio" name="iconid" value="3" />
						<img src="images/posticons/3.gif" alt="贡献"/>
						<input type="radio" name="iconid" value="4" />
						<img src="images/posticons/4.gif" alt="音乐"/>
						<input type="radio" name="iconid" value="5" />
						<img src="images/posticons/5.gif" alt="光碟"/>
						<input type="radio" name="iconid" value="6" />
						<img src="images/posticons/6.gif" alt="游戏"/>
						<input type="radio" name="iconid" value="7" />
						<img src="images/posticons/7.gif" alt="照片"/><br/>
						<input type="radio" name="iconid" value="8" />
						<img src="images/posticons/8.gif" alt="诈唬"/>
						<input type="radio" name="iconid" value="9" />
						<img src="images/posticons/9.gif" alt="播放"/>
						<input type="radio" name="iconid" value="10" />
						<img src="images/posticons/10.gif" alt="点火"/>
						<input type="radio" name="iconid" value="11" />
						<img src="images/posticons/11.gif" alt="体育"/>
						<input type="radio" name="iconid" value="12" />
						<img src="images/posticons/12.gif" alt="提示"/>
						<input type="radio" name="iconid" value="13" />
						<img src="images/posticons/13.gif" alt="阳光"/>
						<input type="radio" name="iconid" value="14" />
						<img src="images/posticons/14.gif" alt="代码脚本"/>
						<input type="radio" name="iconid" value="15" />
						<img src="images/posticons/15.gif" alt="玫瑰"/>
					</td>
				</tr>
			</tbody>			
		</#if>
		<#if isseccode>
			<tbody>
			<tr>
				<th><label for="vcode">验证码</label></th>
				<td><@comm.vcode /></td>
			</tr>
			</tbody>
		</#if>
			<tbody>
			<tr>
				<th>&nbsp;</th>
				<td>
					<input type="hidden" id="postbytopictype" name="postbytopictype" value="${forum.forumfields.postbytopictype}" tabindex="3">
					<input name="topicsubmit" type="submit" id="postsubmit" value="发表主题"/>[完成后可按 Ctrl + Enter 发布]
				</td>
			</tr>
			</tbody>
			</table>
	</form>
	</div>
	<script type="text/javascript">
	if (getQueryString('restore') == '1')
	{
		loadData(true);
	}
	</script>
	</div>
	</#if>
<#else>
	<#if needlogin>
		<@comm.login/>
	<#else>
	<@comm.errmsgbox/>
<script type="text/javascript">setcookie("title", '', 1);</script>
	</#if>
	</div>
</#if>
<script type="text/javascript" src="javascript/template_calendar.js"></script>
<@comm.copyright/>
<@comm.footer/>