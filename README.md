# Comune

Verification receipt library of in app purchase

## TODO
- [x] Verify apple receipt
- [ ] Verify google receipt

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed as:

  1. Add comune to your list of dependencies in `mix.exs`:

```elixir:
  def deps do
    [{:comune, "~> 0.0.1"}]
  end
```

  2. Ensure comune is started before your application:

```elixir:
  def application do
    [applications: [:comune]]
  end
```
