<footer class="footer">
			<div class="container">
				<div class="row">
					<div class="col-md-9">
						<p class="lead text-info"><a href="<?php echo htmlspecialchars(basename($_SERVER["REQUEST_URI"]));?>#hs-chat-open" class="btn btn-lg btn-orange" id="footerbuttonChatWithUsNow" role="button" rel="nofollow"><i class="fa fa-commenting"></i> Chat with us now!</a></p>
						<p style="margin-top:1rem;"><small>Copyright &copy; <?php echo date("Y") ?> ICON Agility Services - All Rights Reserved.</small></p>
					</div>
					<div class="col-md-3">
						<nav class="nav-social">
							<a href="https://twitter.com/bitPimps" class="instagram" id="footerSocialInstagram" target="_blank" title="bitPimps on Instagram" rel="nofollow">
								<i class="fa fa-3x fa-twitter-square" aria-hidden="true"></i> <span class="sr-only">bitPimps on Instagram</span>
							</a>
							<a href="https://twitter.com/bitPimps" class="twitter" id="footerSocialTwitter" target="_blank" title="bitPimps on Twitter" rel="nofollow">
								<i class="fa fa-3x fa-twitter-square" aria-hidden="true"></i> <span class="sr-only">bitPimps on Twitter</span>
							</a>
						</nav>
					</div>
				</div>
			</div>
		</footer>
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/webfont/1.6.26/webfont.js"></script>
		<script>
			/* Font Loader */
			WebFontConfig = {
				google: {
					families: ['Muli','Open+Sans:400,600,700']
				}
			};
			(function(d) {
				var wf = d.createElement('script'), s = d.scripts[0];
				wf.src = 'https://ajax.googleapis.com/ajax/libs/webfont/1.6.26/webfont.js';
				wf.async = true;
				s.parentNode.insertBefore(wf, s);
			})(document);
			/* Analytics */
			window.dataLayer = window.dataLayer || [];
			function gtag(){dataLayer.push(arguments);}
			gtag('js', new Date());
			gtag('config', 'UA-4958472-1');
		</script>
		<script type="application/ld+json">
		{
			"@context": "http://schema.org",
			"@type": "Organization",
			"@id": "https://bitpimps.lixlink.com",
			"name": "bitPimps Custom Modifications",
			"logo": "https://bitpimps.lixlink.com/img/logos/icontc-blue-light.png",
			"url": "https://bitpimps.lixlink.com",
			"sameAs": [
				"https://twitter.com/bitPimps"
			]
		}
		</script>