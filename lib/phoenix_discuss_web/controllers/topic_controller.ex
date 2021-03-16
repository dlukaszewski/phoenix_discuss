defmodule PhoenixDiscuss.TopicController do
   use PhoenixDiscussWeb, :controller
   
    alias PhoenixDiscuss.Topic

    def new(conn, params) do
        changeset = Topic.changeset(%Topic{}, %{})
    end
end