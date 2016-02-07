class ShowsController < ApplicationController
  def index
    sql = %q(
      SELECT shows.title, avg(reviews.score) avg_score, count(reviews.show_id) review_count FROM shows
      INNER JOIN reviews ON reviews.show_id = shows.id GROUP BY reviews.show_id
      ORDER BY avg_score DESC LIMIT 10
    )
    @shows = Show.find_by_sql(sql)
  end
end
