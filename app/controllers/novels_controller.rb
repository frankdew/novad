class NovelsController < ApplicationController

   def create
      novel = Novel.new( novel_params )

      if novel.save
         redirect_to author_path( novel.author_id )
      else
         render new_novel_path
      end
   end

private

   def novel_params
     params.require( :novel ).permit( :title, :year, :cover, :plot, :author_id, genre_ids: [] )
   end

   def edit
     @novel = Novel.find( params[:id] )
   end

   def update
     @novel = Novel.find( params[:id] )

     if @novel.update_attributes( novel_params )
       redirect_to @novel
     else
       render 'edit'
     end

     def destroy
     @novel = Novel.find( params[:id] )

     author_id = @novel.author_id

     @novel.destroy

     redirect_to author_path( author_id )
   end
  end
end
