defmodule Comune.Android.Receipt do
  def verify!(receipt, encoded_signature, encoded_public_key, developer_payload) do
    %{"orderId" => order_id, "developerPayload" => developer_payload} =
      Poison.encode!(receipt)

    # public_key = encoded_public_key
    #               |> Base.decode64!
    #               # |> :public_key.pkix_decode_cert(:plain)
    [rsa_entry] = :public_key.pem_decode(encoded_public_key)
    [_, mod, exp] = :public_key.pem_entry_decode(rsa_entry)

    signature = Base.decode64!(encoded_signature)
    :crypto.verify(:rsa, :sha, receipt, signature, [mod, exp])
  end
end
