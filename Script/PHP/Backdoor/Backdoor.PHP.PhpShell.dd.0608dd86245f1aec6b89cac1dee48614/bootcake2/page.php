<?php
/**
 * The template for displaying all pages.
 *
 * This is the template that displays all pages by default.
 * Please note that this is the WordPress construct of pages
 * and that other 'pages' on your WordPress site will use a
 * different template.
 *
 * @package bootcake
 */

get_header(); ?>
	    <!--breadcrumb start-->
    <div class="site-breadcumb-bg">
        <div class="bootcake-container container">
            <div class="row">
                <div class="site-breadcumb col-sm-12 col-md-12">
                    <ol class="breadcrumb breadcrumb-menubar">
                        <?php if (function_exists('bootcake_custom_breadcrumbs')) bootcake_custom_breadcrumbs(); ?>
                    </ol>
                </div>

            </div>
        </div>
    </div>
    <!--breadcrumb end-->

    <div class="container">
       
            <div id="row" class="row">
                <div class="col-md-8 floatleft">
                    

     <?php if ( has_post_thumbnail()) : ?>
        <a href="<?php the_permalink(); ?>" title="<?php the_title_attribute(); ?>" >
            <?php the_post_thumbnail( 'bootcake-featured', array( 'class' => 'thumbnail' )); ?>
        </a>                
     <?php endif; ?>
		<?php
		// Start the loop.
		while ( have_posts() ) : the_post();

			// Include the page content template.
			get_template_part( 'template-parts/content', 'page' );
            
    // If comments are open or we have at least one comment, load up the comment template.
     if ( comments_open() || get_comments_number() ) :

                comments_template();

       endif;

        // End the loop.
		endwhile;
		?>





</div>

<?php get_sidebar('page'); ?>

</div> <!-- row -->



</div>



<?php get_footer(); ?>