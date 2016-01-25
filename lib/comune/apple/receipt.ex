defmodule Comune.Apple.Receipt do
  defstruct quantity: nil, product_id: nil, transaction_id: nil, purchase_date: nil, app_item_id: nil,
            version_external_identifier: nil, bid: nil, bvrs: nil, original: nil,
            latest: nil, lastest_expired: nil, expires_at: nil

  def error_message(21000) do
    "The App Store could not read the JSON object you provided."
  end

  def error_message(21002) do
  "The data in the receipt-data property was malformed."
  end

  def error_message(21003) do
    "The receipt could not be authenticated."
  end

  def error_message(21004) do
    "The shared secret you provided does not match the shared secret on file for your account."
  end

  def error_message(21005) do
    "The receipt server is not currently available."
  end

  def error_message(21006) do
    "This receipt is valid but the subscription has expired. When this status code is returned to your server, the receipt data is also decoded and returned as part of the response."
  end

  def error_message(21007) do
    "This receipt is a sandbox receipt, but it was sent to the production service for verification."
  end

  def error_message(21008) do
    "This receipt is a production receipt, but it was sent to the sandbox service for verification."
  end

  def error_message(code) do
    "Unknown Error: #{code}"
  end

end
