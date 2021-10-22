<?php
/**
 * The template for displaying search forms in bootcake
 *
 * @package bootcake
 */
?>
<form method="get" class="form-search" action="<?php echo esc_url( home_url( '/' ) ); ?>">
	<div class="form-group">
		<div class="input-group">
	  		<span class="screen-reader-text"><?php _ex( 'Search for:', 'label', 'bootcake' ); ?></span>
	    	<input type="text" class="form-control search-query" placeholder="<?php _e( 'Search...', 'bootcake' ); ?>" value="<?php echo esc_attr( get_search_query() ); ?>" name="s">
	    	<span class="input-group-btn">
	      		<button type="submit" class="btn btn-default" name="submit" id="searchsubmit" value="<?php _e( 'Search', 'bootcake' ); ?>"><i class="fa fa-search"></i></button>
	    	</span>
	    </div>
	</div>
</form>