namespace CloudPayments;

/** Интервал подписки */
enum SubscriptionInterval {
  Day: "Day",
  Week: "Week",
  Month: "Month",
}

/** Модель подписки на рекуррентные платежи */
model SubscriptionModel {
  /** Идентификатор подписки */
  Id: string;

  /** Идентификатор пользователя */
  AccountId: string;

  /** Описание платежа */
  Description?: string;

  /** Email плательщика */
  Email?: string;

  /** Сумма платежа */
  Amount: float64;

  /** Код валюты */
  CurrencyCode: int32;

  /** Валюта */
  Currency: string;

  /** Требуется подтверждение (двухстадийная схема) */
  RequireConfirmation: boolean;

  /** Дата начала (формат /Date(...)/) */
  StartDate: string;

  /** Дата начала ISO */
  StartDateIso: string;

  /** Код интервала */
  IntervalCode: int32;

  /** Интервал */
  Interval: string;

  /** Период */
  Period: int32;

  /** Максимальное количество платежей */
  MaxPeriods?: int32;

  /** Язык */
  CultureName: string;

  /** Код статуса */
  StatusCode: int32;

  /** Статус */
  Status: string;

  /** Количество успешных транзакций */
  SuccessfulTransactionsNumber: int32;

  /** Количество неуспешных транзакций */
  FailedTransactionsNumber: int32;

  /** Дата последней транзакции */
  LastTransactionDate?: string;

  /** Дата последней транзакции ISO */
  LastTransactionDateIso?: string;

  /** Дата следующей транзакции */
  NextTransactionDate?: string;

  /** Дата следующей транзакции ISO */
  NextTransactionDateIso?: string;

  /** Данные чека */
  Receipt?: Record<unknown>;

  /** ID схемы фейловера */
  FailoverSchemeId?: string;
}

/** Запрос на создание подписки */
model SubscriptionCreateRequest {
  /** Токен карты */
  Token: string;

  /** Идентификатор пользователя */
  AccountId: string;

  /** Описание платежа */
  Description: string;

  /** Email плательщика */
  Email?: string;

  /** Сумма платежа */
  Amount: float64;

  /** Валюта */
  Currency: string;

  /** Требуется подтверждение (двухстадийная схема) */
  RequireConfirmation: boolean;

  /** Дата и время первого платежа (UTC) */
  StartDate: utcDateTime;

  /** Интервал: Day, Week, Month */
  Interval: string;

  /** Период (в сочетании с Interval) */
  Period: int32;

  /** Максимальное количество платежей */
  MaxPeriods?: int32;

  /** Данные для онлайн-чека */
  CustomerReceipt?: Record<unknown>;
}

/** Запрос информации о подписке */
model SubscriptionGetRequest {
  /** Идентификатор подписки */
  Id: string;
}

/** Запрос поиска подписок */
model SubscriptionFindRequest {
  /** Идентификатор пользователя */
  AccountId: string;
}

/** Запрос на изменение подписки */
model SubscriptionUpdateRequest {
  /** Идентификатор подписки */
  Id: string;

  /** Описание платежа */
  Description?: string;

  /** Сумма платежа */
  Amount?: float64;

  /** Валюта */
  Currency?: string;

  /** Требуется подтверждение */
  RequireConfirmation?: boolean;

  /** Дата и время следующего платежа (UTC) */
  StartDate?: utcDateTime;

  /** Интервал: Day, Week, Month */
  Interval?: string;

  /** Период */
  Period?: int32;

  /** Максимальное количество платежей */
  MaxPeriods?: int32;

  /** Данные для онлайн-чека */
  CustomerReceipt?: Record<unknown>;

  /** Язык уведомлений (ru-RU, en-US) */
  CultureName?: string;
}

/** Запрос на отмену подписки */
model SubscriptionCancelRequest {
  /** Идентификатор подписки */
  Id: string;
}
