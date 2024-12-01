defmodule KanbanWeb.Router do
  use KanbanWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", KanbanWeb do
    pipe_through :api
  end

  forward "/graphql", Absinthe.Plug, schema: KanbanWeb.GraphQL.Schema
  forward "/graphiql", Absinthe.Plug.GraphiQL, schema: KanbanWeb.GraphQL.Schema

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:kanban, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through [:fetch_session, :protect_from_forgery]

      live_dashboard "/dashboard", metrics: KanbanWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
