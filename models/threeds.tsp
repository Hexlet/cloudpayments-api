namespace CloudPayments;

/** Модель ответа, требующего 3-D Secure аутентификацию */
model ThreeDsRequiredModel {
  /** ID транзакции (используется как MD) */
  TransactionId: int64;

  /** Параметр PaReq для ACS */
  PaReq: string;

  /** Параметр GoReq (опционально) */
  GoReq?: string;

  /** URL сервера аутентификации (ACS) */
  AcsUrl: string;

  /** Данные сессии 3DS */
  ThreeDsSessionData?: string;

  /** Разрешено ли использовать iframe */
  IFrameIsAllowed: boolean;

  /** Ширина фрейма */
  FrameWidth?: int32;

  /** Высота фрейма */
  FrameHeight?: int32;

  /** ID callback для 3DS */
  ThreeDsCallbackId: string;

  /** ID накопления для безопасной сделки */
  EscrowAccumulationId?: string;
}

/** Запрос на завершение 3-D Secure аутентификации */
model Post3dsRequest {
  /** ID транзакции (значение параметра MD) */
  TransactionId: int64;

  /** Результат 3-D Secure аутентификации */
  PaRes: string;
}
