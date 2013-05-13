<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en-US" xmlns="http://www.w3.org/1999/xhtml" dir="ltr">
<head>
	<title>MQWeb - <?= mqweb.qmgr ?> - Channels</title>
	<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
	<link rel="shortcut icon" href="/static/css/images/favicon.ico" />
	<link rel="stylesheet" href="/static/css/style.css" type="text/css" media="all" />
	<link rel="stylesheet" href="/static/css/formalize.css" type="text/css" media="all" />
	<script src="/static/js/jquery-1.9.1.min.js" type="text/javascript"></script>
	<script src="/static/js/jquery.formalize.legacy.min.js" type="text/javascript"></script>
	<script src="/static/js/jquery.form.js" type="text/javascript"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		var options = {
			beforeSubmit : function() {
					$("#result").html($("#ajaxOverlay").html());
					return true;
				},
			success: function() {
				$('.zebra tr:nth-child(even)').addClass('alt');
			},
			target: '#result'
		};
		$('#channelFilterForm').ajaxForm(options);
		
		$("#filterSubmit").prop("disabled", false);
	});

	function showError(el, error)
	{
		var html = '<div style="margin-top:5px;padding:10px;border:1px solid red;background-color:#FF9999;">';
		html += '<img style="float:left;display:block;" src="/static/images/error.png" alt="error" />'
		html += '<div style="float:left;margin-left:20px;">';
		html += '<strong>Object: </strong>' + error.object + '<br />';
		html += '<strong>Function: </strong>' + error.fn + '<br />';
		html += '<strong>Code: </strong>' + error.code  + '<br />';
		html += '<strong>Reason: </strong>' + error.reason;
		html += '</div><div class="cl"> </div>';
		
		el.html(html);
	}
	</script>
</head>
<body>
	<div id="ajaxOverlay" style="display:none;">
	 <div id="ajaxSpinner" style="background:url('/static/images/ajaxSpinner.gif') no-repeat center center transparent; width:100%;height:40px;">
	 </div>
	</div>
	<!-- Wrapper -->
	<div id="wrapper">
		<div class="shell">
			<div id="wrapper-top"></div>
			<!-- Wrapper Middle -->
			<div id="wrapper-middle">
				<!-- Header -->
				<div id="header">
					<!-- Logo -->
					<div id="logo">
						<h1>MQWeb - <a href="/qmgr/view/<?= mqweb.qmgr  ?>" title="home"><?= mqweb.qmgr ?></a></h1>
						<p class="slogan">Administrating Websphere MQ with a browser</p>
					</div>
					<div class="socials">
					<a href="https://github.com/fbraem/mqweb"><img style="position: absolute; top: 0; right: 0; border: 0;" src="https://s3.amazonaws.com/github/ribbons/forkme_right_red_aa0000.png" alt="Fork me on GitHub"></a>
<!--
						<a title="Facebook" class="facebook" href="#">facebook</a>
						<a title="Twitter" class="twitter" href="#">twitter</a>
						<a title="Digg" class="digg" href="#">digg</a>
						<a title="Delicious" class="delicious" href="#">Delicious</a>
						<a title="Stumble Upon" class="su" href="#">su</a>
						<a title="RSS" class="rss" href="#">rss</a> 
-->
					</div>
					<div class="cl"></div>
				</div>
				<!-- END Header -->
				<!-- Navigation -->
				<div id="navigation">
					<ul>
						<li><a title="Home" href="/qmgr/view/<?= mqweb.qmgr ?>">Home</a></li>
						<li><a title="Queues" href="/queue/index/<?= mqweb.qmgr  ?>">Queues</a></li>
						<li><a title="Channels" href="/channel/index/<?=  mqweb.qmgr  ?>">Channels</a></li>
					</ul>
					<div class="cl"></div>
				</div>
				<!-- END Navigation -->
				<!-- Main -->
				<div id="main">
					<!-- Content -->
					<div id="content">
						<div class="post">
							<h3><strong><?= mqweb.qmgr  ?></strong> - Channels</h3>
							<form id="channelFilterForm"  action="/channel/list/<?=mqweb.qmgr?>" method="POST">
								<fieldset>
									<legend>&nbsp;Filter&nbsp;</legend>
										<div style="float:left;margin:5px;">
											<div	style="margin:5px;">
												<label for="channelName">Channel Name: </label><input	type="text"	id="channelName" name="channelName"	value="*"	/>
											</div>
											<div style="margin:5px;">
											 <input type="checkbox" name="channelExcludeSystem" value="1" /> Exclude System Channels
											</div>
										</div>
										<fieldset style="float:right;margin-right:10px;">
											<legend>&nbsp;Channel Type&nbsp;</legend>
										 	<div style="float:left;padding:10px;">
												<input type="radio" name="channelType" value="All" /> All<br />
												<input type="radio" name="channelType" value="Sender" /> Sender<br />
												<input type="radio" name="channelType" value="Server" /> Server<br />
												<input type="radio" name="channelType" value="Receiver" /> Receiver<br />
												<input type="radio" name="channelType" value="Requester" /> Requester<br />
											</div>
										 	<div style="float:left;padding:10px;">
												<input type="radio" name="channelType" value="Server-connection" /> Server-connection<br />
												<input type="radio" name="channelType" value="Client-connection" /> Client-connection<br />
												<input type="radio" name="channelType" value="Cluster-receiver" /> Cluster-receiver<br />
												<input type="radio" name="channelType" value="Cluster-sender" /> Cluster-sender<br />
												<input type="radio" name="channelType" value="Telemetry" /> Telemetry
									 		</div>
										</fieldset>
										<div style="clear:both;" />
										<div style="float:right;margin-right:10px;margin:10px;">
											<input	type="submit"	value="Filter	&gt;&gt;"	id="filterSubmit" disabled="disabled"	/>
										</div>
								 </fieldset>
							</form>
						</div>
					</div>
					<!-- END Content -->
					<!-- Sidebar -->
					<div id="sidebar">
						<div class="box">
							<h3>Our Services</h3>
							<ul>
								<li><a title="List Queues Containing Messages" href="#">List Non-empty Queues</a></li>
								<li><a title="Ipsum is not simply" href="#">Ipsum is not simply</a></li>
								<li><a title="Dom text roots" href="#">Dom text roots</a></li>
								<li><a title="Popular belief lorem" href="#">Popular belief lorem</a></li>
								<li><a title="Ipsum is not simply" href="#">Ipsum is not simply</a></li>
							</ul>
						</div>
					</div>
					<!-- END Sidebar -->
					<div class="cl"></div>
					<div class="widgets">
						<div class="result" id="result">
						</div>
					 	<div class="cl"></div>
						<div class="col contacts">
						</div>
						<div class="cl"></div>
					</div>
				</div>
				<!-- END Main -->
			</div>
			<!-- END Wrapper Middle -->
			<div id="wrapper-bottom"></div>
			<!-- Footer -->
			<div id="footer">
				<p class="copy">Copyright 2012<span>|</span><a href="http://www.zumuta.be">www.zumuta.be</a>. Design by <a title="CSS Free Templates with jQuery Slider" href="http://css-free-templates.com/">CSS-Free-Templates.com</a></p>
			<!--  <p id="bottom-nav"><a title="Home" href="#">Home</a><span>|</span><a title="About" href="#">About</a><span>|</span><a title="Services" href="#">Services</a><span>|</span><a title="Projects" href="#">Projects</a><span>|</span><a title="Solutions" href="#">Solutions</a><span>|</span><a title="Jobs" href="#">Jobs</a><span>|</span><a title="Blog" href="#"> Blog</a><span>|</span><a title="Contacts" href="#">Contacts</a></p> -->
				<div class="cl"></div>
			</div>
			<!-- END Footer -->
		</div>
	</div>
	<!-- END Wrapper -->
</body>
</html>