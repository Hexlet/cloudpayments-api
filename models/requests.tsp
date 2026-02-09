import "./base.tsp";

namespace CloudPayments;

/** Запрос на оплату по криптограмме */
model CryptogramPaymentRequest {
  /** Сумма платежа (до 2 знаков после точки) */
  Amount: float64;

  /** Валюта (RUB по умолчанию) */
  Currency?: string;

  /** IP-адрес плательщика */
  IpAddress: string;

  /** Криптограмма платежных данных */
  CardCryptogramPacket: string;

  /** Имя держателя карты (латиница) */
  Name?: string;

  /** URL сайта, с которого выполняется оплата */
  PaymentUrl?: string;

  /** Номер заказа */
  InvoiceId?: string;

  /** Описание платежа */
  Description?: string;

  /** Язык уведомлений (ru-RU, en-US) */
  CultureName?: string;

  /** Идентификатор пользователя */
  AccountId?: string;

  /** Email плательщика */
  Email?: string;

  /** Информация о плательщике */
  Payer?: Payer;

  /** Дополнительные данные (JSON) */
  JsonData?: Record<unknown>;

  /** Сохранить токен карты для повторных платежей */
  SaveCard?: boolean;
}

/** Запрос на подтверждение двухстадийного платежа */
model ConfirmRequest {
  /** ID транзакции */
  TransactionId: int64;

  /** Сумма подтверждения */
  Amount: float64;

  /** Дополнительные данные (JSON) */
  JsonData?: Record<unknown>;
}

/** Запрос на отмену платежа */
model VoidRequest {
  /** ID транзакции */
  TransactionId: int64;
}

/** Запрос на возврат средств */
model RefundRequest {
  /** ID транзакции оплаты */
  TransactionId: int64;

  /** Сумма возврата */
  Amount: float64;

  /** Дополнительные данные (JSON) */
  JsonData?: Record<unknown>;
}
