import "@typespec/http";

using TypeSpec.Http;

namespace CloudPayments;

/** Валюта платежа */
enum Currency {
  RUB,
  USD,
  EUR,
  GBP,
}

/** Язык уведомлений */
enum CultureName {
  `ru-RU`: "ru-RU",
  `en-US`: "en-US",
}

/** Статус транзакции (код) */
enum StatusCode {
  AwaitingAuthentication: 1,
  Authorized: 2,
  Completed: 3,
  Cancelled: 4,
  Declined: 5,
}

/** Статус транзакции (текст) */
enum TransactionStatus {
  AwaitingAuthentication: "AwaitingAuthentication",
  Authorized: "Authorized",
  Completed: "Completed",
  Cancelled: "Cancelled",
  Declined: "Declined",
}

/** Тип карты */
enum CardType {
  Visa: "Visa",
  MasterCard: "MasterCard",
  Maestro: "Maestro",
  Mir: "MIR",
}

/** Код типа карты */
enum CardTypeCode {
  Visa: 0,
  MasterCard: 1,
  Maestro: 2,
  Mir: 3,
}

/** Информация о плательщике */
model Payer {
  /** Имя */
  FirstName?: string;

  /** Фамилия */
  LastName?: string;

  /** Отчество */
  MiddleName?: string;

  /** Дата рождения (YYYY-MM-DD) */
  Birth?: string;

  /** Улица */
  Street?: string;

  /** Адрес */
  Address?: string;

  /** Город */
  City?: string;

  /** Страна (код ISO) */
  Country?: string;

  /** Телефон */
  Phone?: string;

  /** Почтовый индекс */
  Postcode?: string;
}

/** Базовый ответ API */
model BaseResponse<T> {
  /** Результат выполнения запроса */
  Success: boolean;

  /** Описание ошибки (при наличии) */
  Message?: string;

  /** Данные ответа */
  Model?: T;
}

/** Пустой ответ API (только Success и Message) */
model EmptyResponse {
  /** Результат выполнения запроса */
  Success: boolean;

  /** Описание ошибки (при наличии) */
  Message?: string;
}
