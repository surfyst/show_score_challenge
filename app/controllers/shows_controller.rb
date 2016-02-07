class ShowsController < ApplicationController
  def index
    seed = Time.now.min / 60.0
    sql = "
      SELECT setseed(#{seed}), shows.title, avg(reviews.score) * random() avg_score, count(reviews.show_id) review_count FROM shows
      INNER JOIN reviews ON reviews.show_id = shows.id
      GROUP BY shows.title, reviews.show_id
      ORDER BY avg_score DESC LIMIT 10"
    @shows = Show.find_by_sql(sql)

    respond_to do |format|
      format.json { render json: @shows}
      format.html
    end
  end
end
