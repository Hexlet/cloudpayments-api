import "./base.tsp";

namespace CloudPayments;

/** Запрос на оплату по токену (рекарринг) */
model TokenPaymentRequest {
  /** Сумма платежа (до 2 знаков после точки) */
  Amount: float64;

  /** Валюта (RUB по умолчанию) */
  Currency?: string;

  /** Идентификатор пользователя */
  AccountId: string;

  /** Признак инициатора транзакции: 0 — мерчант, 1 — держатель карты */
  TrInitiatorCode: int32;

  /** Признак регулярного платежа: 0 — нет, 1 — да */
  PaymentScheduled?: int32;

  /** Токен карты */
  Token: string;

  /** Номер заказа */
  InvoiceId?: string;

  /** Описание платежа */
  Description?: string;

  /** IP-адрес плательщика */
  IpAddress?: string;

  /** Email плательщика */
  Email?: string;

  /** Информация о плательщике */
  Payer?: Payer;

  /** Дополнительные данные (JSON) */
  JsonData?: Record<unknown>;
}
