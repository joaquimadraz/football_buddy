defmodule FootballBuddy.Helpers.HttpClient do
  @moduledoc """
  Wrapper arround HTTPoison
  """
  alias FootballBuddy.Helpers.HttpClient.{
    Response,
    Error,
  }

  def get(url, params \\ %{}, options \\ []) do
    url
    |> HTTPoison.get([], poisoned_options(params, options))
    |> process_response()
  end

  defp process_response(response) do
    case response do
      {:ok, %HTTPoison.Response{status_code: status_code, headers: headers, body: body}} ->
        response = %Response{status_code: status_code,
                             headers: headers,
                             body: process_response_body(body)}

        {:ok, response}
      {:error, %HTTPoison.Error{reason: reason}} ->
        {:error, %Error{reason: reason}}
      _ ->
        {:error, %Error{reason: nil}}
    end
  end

  defp process_response_body(body) do
    case Poison.decode(body) do
      {:ok, data} -> data
      _ -> body
    end
  end

  defp poisoned_options(params, options \\ []) do
    hackney_options = case options[:basic_auth] do
      nil -> []
      _ -> Keyword.new(basic_auth: options[:basic_auth])
    end

    Keyword.new(params: params, hackney: hackney_options)
  end
end
