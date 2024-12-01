alias Kanban.Board.{Stage, Card}

todo = %Stage{
  title: "To-Do",
  cards: [
    %Card{
      title: "Learn Gleam",
      description: "Visit the `gleam.run` website and read documentation.",
      priority: :high,
      place: "Home",
      deadline: ~D[2024-12-15],
      attachments: ["gleam_docs_link.pdf"]
    },
    %Card{
      title: "Setup Elixir Environment",
      description: "Install Elixir, OTP, and mix.",
      priority: :medium,
      place: "Office",
      deadline: ~D[2024-12-10],
      attachments: ["install_steps.txt"]
    },
    %Card{
      title: "Explore Phoenix Framework",
      description: "Build a basic app using Phoenix.",
      priority: :high,
      place: "Online",
      deadline: ~D[2024-12-18],
      attachments: []
    },
    %Card{
      title: "Create a Nerves IoT Project",
      description: "Build an IoT app using Nerves.",
      priority: :low,
      place: "Lab",
      deadline: ~D[2024-12-20],
      attachments: ["nerves_project_notes.pdf"]
    }
  ]
}

doing = %Stage{
  title: "Doing",
  cards: [
    %Card{
      title: "Refactor Codebase",
      description: "Improve code structure for legacy project.",
      priority: :medium,
      place: "Office",
      deadline: ~D[2024-12-08],
      attachments: ["legacy_code_todos.txt"]
    },
    %Card{
      title: "Implement Feature X",
      description: "Complete development of Feature X.",
      priority: :high,
      place: "Office",
      deadline: ~D[2024-12-12],
      attachments: ["feature_x_spec.docx"]
    }
  ]
}

done = %Stage{
  title: "Done",
  cards: [
    %Card{
      title: "Read Elixir in Action",
      description: "Finished reading the entire book.",
      priority: :high,
      place: "Home",
      deadline: ~D[2024-11-30],
      attachments: []
    },
    %Card{
      title: "Complete LiveView Tutorial",
      description: "Learned basics of LiveView.",
      priority: :medium,
      place: "Online",
      deadline: ~D[2024-11-25],
      attachments: ["liveview_notes.md"]
    },
    %Card{
      title: "Deploy Sample App to Gigalixir",
      description: "Hosted a Phoenix app on Gigalixir.",
      priority: :high,
      place: "Cloud",
      deadline: ~D[2024-11-20],
      attachments: ["deployment_guide.pdf"]
    },
    %Card{
      title: "Setup Docker for Local Development",
      description: "Configured Docker and Docker Compose for development.",
      priority: :medium,
      place: "Office",
      deadline: ~D[2024-11-15],
      attachments: ["docker_compose.yml"]
    },
    %Card{
      title: "Optimize Database Queries",
      description: "Improved query performance and reduced load times.",
      priority: :high,
      place: "Office",
      deadline: ~D[2024-11-18],
      attachments: ["query_optimization_report.docx"]
    },
    %Card{
      title: "Attend Elixir Conference",
      description: "Participated in the virtual ElixirConf 2024.",
      priority: :low,
      place: "Online",
      deadline: ~D[2024-11-10],
      attachments: ["conference_notes.pdf"]
    },
    %Card{
      title: "Write Tests for Module Y",
      description: "Added comprehensive tests for Module Y functionality.",
      priority: :medium,
      place: "Lab",
      deadline: ~D[2024-11-05],
      attachments: ["module_y_test_cases.md"]
    },
    %Card{
      title: "Experiment with Nx",
      description: "Ran basic experiments using Nx for machine learning.",
      priority: :low,
      place: "Home",
      deadline: ~D[2024-10-30],
      attachments: ["nx_results.csv"]
    },
    %Card{
      title: "Fix Bug in Authentication",
      description: "Resolved critical authentication issue in production.",
      priority: :high,
      place: "Office",
      deadline: ~D[2024-10-25],
      attachments: ["bugfix_authentication_patch.diff"]
    }
  ]
}

Kanban.Repo.insert!(todo)
Kanban.Repo.insert!(doing)
Kanban.Repo.insert!(done)
