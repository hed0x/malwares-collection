<?php
/**
 * The Template for displaying all single posts.
 *
 * @package bootcake
 */

get_header(); ?>
<div class="container">
    

    <div id="row"  class="">

        <div class="col-md-8 floatleft">
		<?php while ( have_posts() ) : the_post(); ?>

			<?php get_template_part( 'template-parts/content', 'single' ); ?>

	

				<?php the_post_navigation(); ?>



			<?php
				// If comments are open or we have at least one comment, load up the comment template
				if ( comments_open() || '0' != get_comments_number() ) :
					comments_template();
				endif;
			?>

		<?php endwhile; // end of the loop. ?>

		</main><!-- #main -->
	</div><!-- #primary -->
</div>
<?php get_sidebar(); ?>

</div>
<?php get_footer(); ?>