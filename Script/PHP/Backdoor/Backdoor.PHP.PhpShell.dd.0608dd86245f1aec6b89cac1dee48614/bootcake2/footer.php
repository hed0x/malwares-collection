<?php
/**
 * The template for displaying the footer.
 *
 * Contains the closing of the #content div and all content after
 *
 * @package bootcake
 */

?>
<footer id="footer" class="" role="contentinfo">
		<div class="container">

			<div id="row" class="row">
				<div class="col-md-8">
	            <?php bootcake_footer(); ?>
			    </div>

			    <div class="col-md-4 up-icon">

			         <a class="back-to-top" href="">Наверх</a>

			    </div>	

			</div> <!-- row -->	
		</div><!-- .site-info .container -->
</footer><!-- #footer -->
</div><!-- #page -->

<?php wp_footer(); ?>

</body>
</html>
