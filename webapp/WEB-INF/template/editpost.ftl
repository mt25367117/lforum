<#-- 
	描述：编辑帖子模板
	作者：黄磊 
	版本：v1.0 
-->
<#import "inc/page_comm.ftl" as comm />
<@comm.header/>
<script type="text/javascript" src="javascript/template_calendar.js"></script>
<script type="text/javascript">
var postminchars = parseInt(${config.minpostsize.toString()});
var postmaxchars = parseInt(${config.maxpostsize.toString()});
var disablepostctrl = parseInt(${disablepostctrl.toString()});
var tempaccounts = false;
</script>
<#if reqcfg.page_err==0>
<#if ispost>
<@comm.msgbox/>
<#else>
<div id="foruminfo">
	<div id="nav">
		<a href="${config.forumurl}" class="home">${config.forumtitle}</a> &raquo; ${forumnav} &raquo; <a href="showtree.action?topicid=${topic.tid}&postid=${postinfo.pid}">${topic.title}</a>&raquo; 编辑帖子
	</div>
</div>	

<div id="previewtable" style="display: none" class="mainbox">
	<h3>预览帖子</h3>
	<table cellspacing="0" cellpadding="0" summary="预览帖子">
		<tr>
		<td>${username}-${nowdatetime}</td>
		<td>
			<div id="previewmessage"></span>
		</td>
		</tr>
	</table>
</div>

<div class="mainbox">
	<h3>修改帖子</h3>
	<form method="post" name="postform" id="postform" action="" enctype="multipart/form-data" onsubmit="return validate(this);">
	<table cellspacing="0" cellpadding="0" summary="修改帖子">
		<tbody>
		<tr>
			<th width="200">用户名</th>
			<td>
			<#if (userid>0)>
				${username} [<a href="logout.action?userkey=${userkey}">退出登录</a>]
			<#else>
				匿名 [<a href="login.action">登录</a>] [<a href="register.action">注册</a>]
			</#if>
			</td>
		</tr>
		</tbody>
		<tbody>
		<tr>
			<th><label for="title">标题</label></th>
			<td>
			<#if topic.special==4>
			<select id="debateopinion" name="debateopinion">
			<option selected="" value="0"/>
			<option value="1">正方</option>
			<option value="2">反方</option>
			</select>
			<script type="text/javascript">$('debateopinion').selectedIndex = parseInt(getQueryString("debate"));</script>
			</#if>
			<#if postinfo.layer==0 && forum.forumfields.applytopictype==1>
				<#if topictypeselectoptions!="">
				<select name="typeid" id="typeid">${topictypeselectoptions}</select>
				<script>document.getElementById('typeid').value='${topic.typeid}';</script>
				</#if>
			</#if>
			<input name="title" type="text" id="title" value="${postinfo.title}" size="60" title="标题最多为60个字符" />
			<#if (postinfo.layer>0)>
			<em class="tips">(可选)</em>
			</#if>
			<#if canhtmltitle>
			<a href="###" id="titleEditorButton" onclick="">高级编辑</a>
			<script type="text/javascript" src="javascript/dnteditor.js"></script>
			<div id="titleEditorDiv" style="display: none;">
				<textarea name="htmltitle" id="htmltitle" cols="80" rows="10"></textarea>
				<script type="text/javascript">
					var forumpath = '${forumurl}';
					var templatepath = '${templatepath}';
					var temptitle = $('faketitle');
					var titleEditor = null;
					function AdvancedTitleEditor() {
						$('title').style.display = 'none';
						$('titleEditorDiv').style.display = '';
						$('titleEditorButton').style.display = 'none';
						titleEditor = new DNTeditor('htmltitle', '500', '50', '${htmltitle}'==''?$('title').value:'${htmltitle}');

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
			<#if htmltitle!="">
			<script type="text/javascript">				
				AdvancedTitleEditor();
			</script>
			</#if>
			</#if>
		</td>
		</tr>
		</tbody>
	<#if postinfo.layer==0>
		<#if topic.special==1>
		<!--投票开始-->		
		<tbody>
		<tr>
			<th><label for="enddatetime">投票结束日期:</label></th>
			<td>				
				<input name="enddatetime" type="text" id="enddatetime" size="10" value="${pollinfo.expiration}" style="cursor:default" onClick="showcalendar(event, 'enddatetime', 'cal_startdate', 'cal_enddate', '${nowdate}');" readonly="readonly" /></span>
				<input type="hidden" name="cal_startdate" id="cal_startdate" size="10"  value="{nowdate}">
				<input type="hidden" name="cal_enddate" id="cal_enddate" size="10"  value="">					
			</td>
		</tr>
		</tbody>
		<tbody>
		<tr>
			<th>
			   <input name="updatepoll" type="hidden" id="updatepoll" value="1" />
			   <input type="checkbox" name="visiblepoll" <#if pollinfo.visible==1>checked="checked"</#if> /> 提交投票后结果才可见<br />
			   <input <#if pollinfo.multiple==1>checked="checked"</#if> type="checkbox" name="multiple"  onclick="this.checked?$('maxchoicescontrol').style.display='':$('maxchoicescontrol').style.display='none';" class="checkinput" /> 多选投票<br />
			   <span id="maxchoicescontrol" <#if pollinfo.multiple==0>style="display: none;"</#if> >最多可选项数: <input type="text" name="maxchoices" value="${pollinfo.maxchoices}" size="5"></span>
			</th>
			<td>
				<div id="divPoll">
				  显示顺序<input name="button" type="button" onclick="clonePoll('${config.maxpolloptions}')" value="增加投票项" />
				  <input name="button" type="button" onclick="if(!delObj(document.getElementById('polloptions'), (is_ie ? 2 : 4))){alert('投票项不能少于2个');}" value="删除投票项" />
				  <input id="PollItemname" type="hidden" name="PollItemname" value="" />
				  <input id="PollOptionDisplayOrder" type="hidden" name="PollOptionDisplayOrder" value="" />
				  <input id="PollOptionID" type="hidden" name="PollOptionID" value="" />
				  <div id="polloptions">
				  <#list polloptionlist as poll>
					<div  <#if poll.polloptionid==1>id="divPollItem"</#if> name="PollItem" style="padding-top:4px">
					  <input type="hidden" name="optionid" value="${poll.polloptionid}">
					  <input type="text" size="4" name="displayorder" maxlength="4" class="colorblue" onfocus="this.className='colorfocus';" onblur="this.className='colorblue';" value="${poll.displayorder}"  />
					  <input type="text" size="70"  name="pollitemid" class="colorblue" onfocus="this.className='colorfocus';" onblur="this.className='colorblue';" value="${poll.name}" />
					</div>
				  </#list>
				  </div>
				</div>
			</td>
		</tr>
		</tbody>				
		<!--投票结束-->	      	
		</#if>      
		<#if topic.special==2>
		<tbody>
		<tr>
			<th><label for="topicprice">悬赏价格</label></th>
			<td>
			<input name="topicprice" type="text" id="topicprice" value="${topic.price}" size="5" onkeyup="getrealprice(this.value);" />
				${userextcreditsinfo.unit}
				${userextcreditsinfo.name}
				&nbsp;&nbsp;
				<script type="text/javascript">
					function getrealprice(price)
					{
						var oldprice = {topic.price};
						if(!price.search(/^\d+$/) ) {
							n = parseInt(price) - oldprice;

							if (price < oldprice) {
								$('realprice').innerHTML = '<b>不能降低悬赏积分</b>';
							}else if (price < ${usergroupinfo.minbonusprice} || price > ${usergroupinfo.maxbonusprice}) {
								$('realprice').innerHTML = '<b>悬赏超出范围</b>';
							} else {
								$('realprice').innerHTML = '追加悬赏: ' + n + ' ${userextcreditsinfo.unit}${userextcreditsinfo.name}';
							}
						}else{
							$('realprice').innerHTML = '<b>填写无效</b>';
						}
					}
				</script>
				<span id="realprice"></span>
			</td>
		</tr>
		</tbody>
		<#elseif topic.special==3>
		<tbody>
		<tr>
			<th>悬赏价格</th>
			<td>
				${topic.price}
				${userextcreditsinfo.unit}
				${userextcreditsinfo.name}
				&nbsp;&nbsp;[已经结帖无法修改悬赏金额]
			</td>
		</tr>
		</tbody>
		</#if>
	</#if>
		<tbody>
		<tr>
			<@comm.editor/>
		</tr>
		</tbody>
	<#if enabletag>
		<tbody>
		<tr>
			<th>标签(Tags):</th>
			<td><input type="text" name="tags" id="tags" value="${topictags}" size="55" />&nbsp;<input type="button" onclick="relatekw();" value="可用标签" />(用空格隔开多个标签，最多可填写 5 个)</td>
		</tr>
		</tbody>
	</#if>
	<#if  canpostattach && (postinfo.attachment>0)> 
		<tbody>
		<tr>
			<th>&nbsp;</th>
			<td><input type="button" value="查看已上传附件>>" onclick="expandoptions('attachfilelist');"/></td>
		</tr>
		</tbody>
		<!--附件列表开始-->
		<tbody>
		<tr>
		<td colspan="2">
		<div id="attachfilelist" style="display:none">
		<#if (postinfo.attachment>0)>
			<script type="text/javascript">
			var attachments = new Array();
			var attachimgurl = new Array();
			function restore(aid) {
			obj = $('attach' + aid);
			objupdate = $('attachupdate' + aid);
			obj.style.display = '';
			objupdate.innerHTML = '<input type="file" name="attachupdated" style="display: none;">';
			
			}
			function attachupdate(aid) {
			obj = $('attach' + aid);
			objupdate = $('attachupdate' + aid);
			obj.style.display = 'none';
			objupdate.innerHTML = '<input type="file" name="attachupdated" class="colorblue" onfocus="this.className=\'colorfocus\';" onblur="this.className=\'colorblue\';"  size="15" /><input type="hidden" value="' + aid + '" name="attachupdatedid" /> <input  onfocus="this.className=\'colorfocus\';" onblur="this.className=\'colorblue\';" class="colorblue" type="button" value="取 &nbsp; 消" onclick="restore(\'' + aid + '\')" />';
			}
			function insertAttachTag(aid) {
			if (bbinsert && wysiwyg) {
			insertText('[attach]' + aid + '[/attach]', false);
			} else {
			AddText('[attach]' + aid + '[/attach]');
			}
			}
			function insertAttachimgTag(aid) {
			if (bbinsert && wysiwyg) {
			var attachimgurl = eval('attachimgurl_' + aid);
			insertText('<img src="' + attachimgurl[0] + '" border="0" aid="attachimg_' + aid + '" alt="" />', false);
			} else {
			AddText('[attachimg]' + aid + '[/attachimg]');
			}
			}
			</script>
			<table border="0" align="center" cellpadding="4" cellspacing="0" summary="附件">
			<tr>
				<td width="5%" align="center">删除</td>
				<td width="5%" >附件ID</td>
				<td width="25%">文件名</td>
				<td width="15%">时间</td>
				<td width="10%">附件大小</td>
				<td width="10%">下载次数</td>
				<td width="5%">阅读权限</td>
				<td width="20%">描述</td>
			</tr>
			<#list attachmentlist as attachment>
			<#if attachment.postid.pid==postinfo.pid>
			<tr onmouseover="this.style.backgroundColor='#fff'" onmouseout="this.style.backgroundColor='#F5FBFF'">
			<td align="center"><input class="checkbox" name="deleteaid" value="${attachment.aid}" type="checkbox"><!--<a href="javascript:deleteatt({attachment[aid]});">删除</a>--></td>
			<td >${attachment.aid}<input type="hidden" value="${attachment.aid}" name="attachupdateid" /></td>
			<td>
				<div id="attach${attachment.aid}">
					<!--<a href="###" onclick="attachupdate('${attachment.aid}')">[更新]</a>-->
					<a href="###" onclick="<#if (attachment.filetype.indexOf("image")>-1)>insertAttachimgTag('${attachment.aid}');<#else>insertAttachTag('${attachment.aid}');</#if>" title="点击这里将本附件插入帖子内容中当前光标的位置">[插入]</a>
					<script type="text/javascript">attachimgurl_${attachment.aid} = ['attachment.action?attachmentid=${attachment.aid}', 400];</script>
					<span id="imgpreview_${attachment.aid}" <#if (attachment.filetype.indexOf("image")>-1)>onmouseover="if($('imgpreview_${attachment.aid}_image').width > 400)$('imgpreview_${attachment.aid}_image').width = 400;showMenu(this.id, 0, 0, 1, 0);"</#if>><a href="attachment.action?attachmentid=${attachment.aid}">${attachment.attachment}</a></span>
					
				</div>
				<span id="attachupdate${attachment.aid}"><input type="file" name="attachupdated" style="display: none;"></span>
				<#if (attachment.filetype.indexOf("image")>-1)>
				<div class="popupmenu_popup" id="imgpreview_${attachment.aid}_menu" style="display: none;width:420px;"><img id="imgpreview_${attachment.aid}_image" src="upload/${attachment.filename}" onerror="this.onerror=null;this.src='${attachment.filename}';" />
				</div>
				</#if>
			</td>
			<td>${attachment.postdatetime}</td>
			<td>${attachment.filesize} 字节</td>
			<td>${attachment.downloads}</td>
			<td><input type="text" name="attachupdatereadperm" size="1" value=${attachment.readperm} /></td>
			<td><input type="text" name="attachupdatedesc" size="25" value=${attachment.description} /></td>
			</tr>
			</#if>
			</#list>
			</table>
			</#if>
		</div>
		</#if>
		</td>
		</tr>
		</tbody>
		<!--附件列表结束-->
		<#if isseccode>
		<tbody>
		<tr>
			<th>验证码</th>
			<td><@comm.vcode/></td>
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
				<#if postinfo.layer==0>
			<tr>
				<th><label for="topicreadperm">阅读权限</label></th>
				<td>
					<input name="topicreadperm" type="text" id="topicreadperm" value="${topic.readperm}" size="5" />
				</td>
			</tr>
				</#if>
			</#if>

			<#if topic.special==0 >
				<#if postinfo.layer==0>
				<#if scoresetManager.getCreditsTrans()!=0 && (usergroupinfo.maxprice>0)>
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
				</#if>
				<tr>
					<th><label for="iconid">图标</label></th>
					<td>
					<input name="iconid" type="radio" value="0" <#if topic.iconid==0>checked="checked"</#if>/>无
					<input type="radio" name="iconid" value="1" <#if topic.iconid==1>checked="checked"</#if>/><img src="images/posticons/1.gif"/>
					<input type="radio" name="iconid" value="2" <#if topic.iconid==2>checked="checked"</#if>/><img src="images/posticons/2.gif"/>
					<input type="radio" name="iconid" value="3" <#if topic.iconid==3>checked="checked"</#if>/><img src="images/posticons/3.gif"/>
					<input type="radio" name="iconid" value="4" <#if topic.iconid==4>checked="checked"</#if>/><img src="images/posticons/4.gif"/>
					<input type="radio" name="iconid" value="5" <#if topic.iconid==5>checked="checked"</#if>/><img src="images/posticons/5.gif"/>
					<input type="radio" name="iconid" value="6" <#if topic.iconid==6>checked="checked"</#if>/><img src="images/posticons/6.gif"/>
					<input type="radio" name="iconid" value="7" <#if topic.iconid==7>checked="checked"</#if>/><img src="images/posticons/7.gif"/> <br />
					<input type="radio" name="iconid" value="8" <#if topic.iconid==8>checked="checked"</#if>/><img src="images/posticons/8.gif"/>
					<input type="radio" name="iconid" value="9" <#if topic.iconid==9>checked="checked"</#if>/><img src="images/posticons/9.gif"/>
					<input type="radio" name="iconid" value="10" <#if topic.iconid==10>checked="checked"</#if>/><img src="images/posticons/10.gif"/>
					<input type="radio" name="iconid" value="11" <#if topic.iconid==11>checked="checked"</#if>/><img src="images/posticons/11.gif"/>
					<input type="radio" name="iconid" value="12" <#if topic.iconid==12>checked="checked"</#if>/><img src="images/posticons/12.gif"/>
					<input type="radio" name="iconid" value="13" <#if topic.iconid==13>checked="checked"</#if>/><img src="images/posticons/13.gif"/>
					<input type="radio" name="iconid" value="14" <#if topic.iconid==14>checked="checked"</#if>/><img src="images/posticons/14.gif"/>
					<input type="radio" name="iconid" value="15" <#if topic.iconid==15>checked="checked"</#if>/>
					</td>
				</tr>
			</#if>
		</tbody>
		<tbody>
		<tr>
			<th>&nbsp;</th>
			<td>
			<#if postinfo.layer==0 && forum.forumfields.applytopictype==1>
			<input type="hidden" id="postbytopictype" name="postbytopictype" value="${forum.forumfields.postbytopictype}" tabindex="3" >
			</#if>
			<input name="editsubmit" type="submit" id="postsubmit" value="编辑帖子" />	[完成后可按 Ctrl + Enter 发布]
			</td>
		</tr>
		</tbody>
		</table>
		<input type="hidden" name="aid" id="aid" value="0">
		<input type="hidden" name="isdeleteatt" id="isdeleteatt" value="0">
		<script type="text/javascript">
			isfirstpost  = ${postinfo.layer} == 0 ? 1 : 0;
			$('postform').onsubmit = function() { return validate($('postform'));};
			function deleteatt(aid){
				document.getElementById('isdeleteatt').value = 1;
				document.getElementById('aid').value = aid;
				document.getElementById('isdeleteatt').form.submit();
			}
		</script>
		<p class="textmsg" id="divshowuploadmsg" style="display:none"></p>
		<p class="textmsg succ" id="divshowuploadmsgok" style="display:none"></p>
		<input type="hidden" name="uploadallowmax" value="10">
		<input type="hidden" name="uploadallowtype" value="jpg,gif">
		<input type="hidden" name="thumbwidth" value="300">
		<input type="hidden" name="thumbheight" value="250">
		<input type="hidden" name="noinsert" value="0">
</form>
</div>
</div>
</#if>
<#else>
<@comm.errmsgbox/>
</#if>
</div>
<@comm.copyright/>
<@comm.footer/>