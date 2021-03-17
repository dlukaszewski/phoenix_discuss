defmodule PhoenixDiscussWeb.TopicController do
   use PhoenixDiscussWeb, :controller
   
    alias PhoenixDiscuss.Topic

    def new(conn, _params) do
        changeset = Topic.changeset(%Topic{}, %{})

        render(conn, "new.html", changeset: changeset)
    end

    def create(conn, %{"topic" => topic}) do
        
    end
end