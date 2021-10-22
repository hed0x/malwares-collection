<?php
/**
 * @package bootcake
 */
?>

<article id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
	<header class="entry-header page-header">

		<?php the_post_thumbnail( 'bootcake-featured', array( 'class' => 'thumbnail' )); ?>

		<h1 class="entry-title "><?php the_title(); ?></h1>

     		<?php if ( 'post' == get_post_type() ) : ?>
		<div class="entry-meta">
			<?php  bootcake_posted_on(); ?>
			<?php if ( ! post_password_required() && ( comments_open() || '0' != get_comments_number() ) ) : ?>
		<span class="comments-link"><i class="fa fa-comment-o"></i><?php comments_popup_link( __( 'Leave a comment', 'bootcake' ), __( '1 Comment', 'bootcake' ), __( '% Comments', 'bootcake' ) ); ?></span>
		<?php endif; ?>

		<?php if ( 'post' == get_post_type() ) : // Hide category and tag text for pages on Search ?>
			<?php
				/* translators: used between list items, there is a space after the comma */
				$categories_list = get_the_category_list( __( ', ', 'bootcake' ) );
				if ( $categories_list) :
			?>
			<span class="cat-links"><i class="fa fa-folder-open-o"></i>
				<?php printf( __( ' %1$s', 'bootcake' ), $categories_list ); ?>
			</span>
			<?php endif; // End if categories ?>
		<?php endif; // End if 'post' == get_post_type() ?>

		<?php edit_post_link( __( 'Edit', 'bootcake' ), '<i class="fa fa-pencil-square-o"></i><span class="edit-link">', '</span>' ); ?>

		</div><!-- .entry-meta -->
		<?php endif; ?>
	</header><!-- .entry-header -->

	<div class="entry-content">
		<?php the_content(); ?>
		<?php
			wp_link_pages( array(
				'before'            => '<div class="page-links">'.__( 'Pages:', 'bootcake' ),
				'after'             => '</div>',
				'link_before'       => '<span>',
				'link_after'        => '</span>',
				'pagelink'          => '%',
				'echo'              => 1
       		) );
    	?>
	</div><!-- .entry-content -->
</article><!-- #post-## -->
