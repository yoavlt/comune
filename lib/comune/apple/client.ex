defmodule Comune.Apple.Client do

  require Logger

  @itunes_prod_endpoint "https://buy.itunes.apple.com/verifyReceipt"
  @itunes_dev_endpoint  "https://sandbox.itunes.apple.com/verifyReceipt"

  def endpoint do
    conf = Application.get_env(:comune, :apple)
    case conf[:env] do
      :production -> @itunes_prod_endpoint
      :sandbox    -> @itunes_dev_endpoint
      _           ->
        Logger.warn(
          "Missing apple billing environment. " <>
          "Please put it into your configuration file."
        )
        @itunes_dev_endpoint
    end
  end

  def verify(data) do
    params = %{"receipt-data" => data}
    case Comune.API.post(endpoint, params) do
      {:ok, %{"status" => 0, "receipt" => receipt}} ->
        struct(Comune.Apple.Receipt, receipt)
      {:ok, %{"status" => 21006, "receipt" => receipt}} ->
        struct(Comune.Apple.Receipt, receipt)
      {:error, %{"status" => status}} ->
        {:error, Comune.Apple.Receipt.error_message(status)}
    end
  end
end
