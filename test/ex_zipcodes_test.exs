defmodule ExZipcodesTest do
  use ExUnit.Case, async: true
  doctest ExZipcodes
  alias ExZipcodes

  test "loads on demand" do
    assert ExZipcodes.lookup(98105) == {:ok, %{city: "Seattle", state: "WA"}}
  end
end
