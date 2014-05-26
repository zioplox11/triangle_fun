class TrianglesController < ApplicationController

  def index
        @triangles = Triangle.all
  end

  def show

      @triangle = Triangle.find(params[:id])
      @largest_path = @triangle.largest_path

  end

  def create
    # binding.pry
    body = params[:tri_body]
    my_bi_tri = Triangle.new
    my_bi_tri.body = body
    my_bi_tri.save
    redirect_to triangle_path(my_bi_tri)
  end


end

