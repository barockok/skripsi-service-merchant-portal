namespace rb XYZThrift

struct Merchant {
  1: string id,
  2: string website,
  3: string notification_url,
  4: bool active,
  5: string name,
  6: string url,
  7: string bank_mid,
  8: string notification_email,
  9: string industry,
}

struct Transaction {
  1: string id,
  2: optional string transaction_time,
  3: optional string merchant_id,
  4: optional string bank_mid,
  5: optional i32 gross_amount,
  6: optional string customer_name,
  7: optional string customer_email,
  8: optional string status,
}

exception MerchantNotFound {
  1: string reason,
}

service MerchantService {
  Merchant get(1:string merchantId) throws (1:MerchantNotFound err)
}

service NotificationService {
  string send(1:string url, 2:Transaction transaction)
}
