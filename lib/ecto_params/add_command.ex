defmodule EctoParams.AddCommand do
  use Ecto.Schema

  embedded_schema do
    field(:a, :integer)
    field(:b, :integer)
  end

  def changeset(struct, params) do
    struct
    |> Ecto.Changeset.cast(params, [:a, :b])
    |> Ecto.Changeset.change()
    |> Ecto.Changeset.validate_required([:a, :b])
    |> Ecto.Changeset.apply_action(:nothing)
  end
end
