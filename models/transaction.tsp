namespace CloudPayments;

/** Модель транзакции в ответе API */
model TransactionModel {
  /** Код причины отклонения (0 = успех) */
  ReasonCode: int32;

  /** Public ID терминала */
  PublicId: string;

  /** URL терминала */
  TerminalUrl: string;

  /** Номер транзакции */
  TransactionId: int64;

  /** Сумма платежа */
  Amount: float64;

  /** Валюта платежа */
  Currency: string;

  /** Код валюты */
  CurrencyCode: int32;

  /** Сумма платежа в валюте оплаты */
  PaymentAmount: float64;

  /** Валюта оплаты */
  PaymentCurrency: string;

  /** Код валюты оплаты */
  PaymentCurrencyCode: int32;

  /** Номер заказа */
  InvoiceId?: string;

  /** Идентификатор пользователя */
  AccountId?: string;

  /** Email плательщика */
  Email?: string;

  /** Описание платежа */
  Description?: string;

  /** Дополнительные данные JSON */
  JsonData?: string;

  /** Дата создания (формат /Date(...)/) */
  CreatedDate: string;

  /** Дата выплаты */
  PayoutDate?: string;

  /** Дата выплаты ISO */
  PayoutDateIso?: string;

  /** Сумма выплаты */
  PayoutAmount?: float64;

  /** Дата создания ISO */
  CreatedDateIso: string;

  /** Дата авторизации */
  AuthDate?: string;

  /** Дата авторизации ISO */
  AuthDateIso?: string;

  /** Дата подтверждения */
  ConfirmDate?: string;

  /** Дата подтверждения ISO */
  ConfirmDateIso?: string;

  /** Код авторизации */
  AuthCode?: string;

  /** Режим тестирования */
  TestMode: boolean;

  /** Retrieval Reference Number */
  Rrn?: string;

  /** ID оригинальной транзакции */
  OriginalTransactionId?: int64;

  /** ID отклоненной транзакции fallback сценария */
  FallBackScenarioDeclinedTransactionId?: int64;

  /** IP-адрес плательщика */
  IpAddress: string;

  /** Страна по IP */
  IpCountry: string;

  /** Город по IP */
  IpCity?: string;

  /** Регион по IP */
  IpRegion?: string;

  /** Округ по IP */
  IpDistrict?: string;

  /** Широта по IP */
  IpLatitude?: float64;

  /** Долгота по IP */
  IpLongitude?: float64;

  /** Первые 6 цифр карты */
  CardFirstSix: string;

  /** Последние 4 цифры карты */
  CardLastFour: string;

  /** Срок действия карты */
  CardExpDate: string;

  /** Тип карты (Visa, MasterCard, etc.) */
  CardType: string;

  /** Продукт карты */
  CardProduct?: string;

  /** Категория карты */
  CardCategory?: string;

  /** ID накопления для безопасной сделки */
  EscrowAccumulationId?: string;

  /** Страна банка-эмитента */
  IssuerBankCountry: string;

  /** Банк-эмитент */
  Issuer: string;

  /** Код типа карты */
  CardTypeCode: int32;

  /** Статус транзакции (текст) */
  Status: string;

  /** Код статуса транзакции */
  StatusCode: int32;

  /** Язык */
  CultureName: string;

  /** Причина (текст) */
  Reason: string;

  /** Сообщение для держателя карты */
  CardHolderMessage: string;

  /** Тип операции */
  Type: int32;

  /** Признак возврата */
  Refunded: boolean;

  /** Имя держателя карты */
  Name?: string;

  /** Токен карты для повторных платежей */
  Token?: string;

  /** ID подписки */
  SubscriptionId?: string;

  /** Имя шлюза */
  GatewayName: string;

  /** Признак Android Pay */
  AndroidPay: boolean;

  /** Тип кошелька */
  WalletType: string;

  /** Общая комиссия */
  TotalFee: float64;
}

/** Модель для ответа refund */
model RefundModel {
  /** ID транзакции возврата */
  TransactionId: int64;
}
