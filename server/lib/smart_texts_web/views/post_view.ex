defmodule SmartTextsWeb.PostView do
  use SmartTextsWeb, :view
  alias SmartTextsWeb.PostView
  alias SmartTextsWeb.UserView

  def render("index.json", %{posts: posts}) do
    %{data: render_many(posts, PostView, "post.json")}
  end

  def render("show.json", %{post: post}) do
    %{data: render_one(post, PostView, "post.json")}
  end

  def render("post.json", %{post: post}) do
    user = if Ecto.assoc_loaded?(post.user) do
      render_one(post.user, UserView, "user.json")
    else
      nil
    end

    %{
      id: post.id,
      title: post.title,
      photo_hash: post.photo_hash,
      user: user,
      offer: post.offer,
      coupon: post.coupon,
      age: post.age,
      gender: post.gender,
      education: post.education,
      employment: post.employment,
      income: post.income
    }
  end
end
