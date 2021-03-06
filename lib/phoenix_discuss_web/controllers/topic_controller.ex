defmodule PhoenixDiscussWeb.TopicController do
   use PhoenixDiscussWeb, :controller

    alias PhoenixDiscuss.Topic
    alias PhoenixDiscuss.Repo

    def index(conn,_param) do
        topics = Repo.all(Topic)
        render(conn, "index.html", topics: topics)
    end

    def new(conn, _params) do
        changeset = Topic.changeset(%Topic{}, %{})

        render(conn, "new.html", changeset: changeset)
    end

    def create(conn, %{"topic" => topic}) do
        changeset = Topic.changeset(%Topic{}, topic)

        case Repo.insert(changeset) do
            {:ok, _topic} ->
                conn
                |> put_flash(:info, "Topic Created")
                |> redirect(to: Routes.topic_path(conn, :index))
            {:error, changeset} ->
                # conn
                # |> put_flash(:error, "Topic Can't Be Blank")
                # |> redirect(to: Routes.topic_path(conn, :new)) Opcja z Wykorzystaniem Phoenixa
                render(conn, "new.html", changeset: changeset) # Opcja z wykorzystaniem CSS
        end
    end

    def edit(conn, %{"id" => topic_id}) do
        topic = Repo.get(Topic, topic_id)
        changeset = Topic.changeset(topic)

        render conn, "edit.html", changeset: changeset, topic: topic
    end
    def update(conn, %{"id" => topic_id, "topic" => topic}) do
        old_topic = Repo.get(Topic, topic_id)
        changeset = Topic.changeset(old_topic, topic)

        case Repo.update(changeset) do
            {:ok , _topic}->
                conn
                |> put_flash(:info, "Topic Updated")
                |> redirect(to: Routes.topic_path(conn, :index))
            {:error, changeset}->
                render(conn, "edit.html", changeset: changeset, topic: old_topic)
        end
    end
    def delete(conn, %{"id" => topic_id}) do
        Repo.get!(Topic, topic_id) |> Repo.delete!

        conn
        |> put_flash(:info, "Topic Deleted")
        |> redirect(to: Routes.topic_path(conn, :index))
    end
end
