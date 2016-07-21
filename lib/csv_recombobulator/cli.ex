defmodule CsvRecombobulator.CLI do
  def parse(argv) do
    argv
    |> process
  end

  def process(csv_file) do
    File.stream!(csv_file)
    |> CSV.decode(headers: true, separator: ?,)
    |> Enum.take(1)
  end

  def extract_headers(csv_file) do
    File.stream!(csv_file)
    |> CSV.decode(separator: ?,)
    |> Enum.take(1)
    |> print_headers()
  end

  def print_headers(headers) do
    for header <- headers, do: header
  end
end
