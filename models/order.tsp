namespace CloudPayments;

/** Модель заказа (счёта) */
model OrderModel {
  /** Идентификатор заказа */
  Id: string;

  /** Номер заказа */
  Number: int32;

  /** Сумма платежа */
  Amount: float64;

  /** Валюта */
  Currency: string;

  /** Код валюты */
  CurrencyCode: int32;

  /** Email плательщика */
  Email?: string;

  /** Телефон плательщика */
  Phone?: string;

  /** Описание платежа */
  Description: string;

  /** Требуется подтверждение (двухстадийная схема) */
  RequireConfirmation: boolean;

  /** Ссылка на оплату */
  Url: string;

  /** Язык */
  CultureName: string;

  /** Дата создания (формат /Date(...)/) */
  CreatedDate: string;

  /** Дата создания ISO */
  CreatedDateIso: string;

  /** Дата оплаты */
  PaymentDate?: string;

  /** Дата оплаты ISO */
  PaymentDateIso?: string;

  /** Код статуса */
  StatusCode: int32;

  /** Статус */
  Status: string;

  /** Внутренний ID */
  InternalId: int32;
}

/** Запрос на создание заказа (счёта) */
model OrderCreateRequest {
  /** Сумма платежа */
  Amount: float64;

  /** Валюта (RUB по умолчанию) */
  Currency?: string;

  /** Описание платежа */
  Description: string;

  /** Email плательщика */
  Email?: string;

  /** Требуется подтверждение (двухстадийная схема) */
  RequireConfirmation?: boolean;

  /** Отправить ссылку на email */
  SendEmail?: boolean;

  /** Номер заказа в системе мерчанта */
  InvoiceId?: string;

  /** Идентификатор пользователя */
  AccountId?: string;

  /** Ссылка на оферту */
  OfferUri?: string;

  /** Телефон плательщика */
  Phone?: string;

  /** Отправить ссылку по SMS */
  SendSms?: boolean;

  /** Отправить ссылку через Viber */
  SendViber?: boolean;

  /** Язык уведомлений (ru-RU, en-US) */
  CultureName?: string;

  /** Поведение подписки: CreateWeekly, CreateMonthly */
  SubscriptionBehavior?: string;

  /** URL редиректа при успешной оплате */
  SuccessRedirectUrl?: string;

  /** URL редиректа при неуспешной оплате */
  FailRedirectUrl?: string;

  /** Дополнительные данные (JSON) */
  JsonData?: Record<unknown>;
}

/** Запрос на отмену заказа (счёта) */
model OrderCancelRequest {
  /** Идентификатор заказа */
  Id: string;
}
