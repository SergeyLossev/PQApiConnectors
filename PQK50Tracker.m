(id as text, dateStart as date, dateFinish as date, token as text) =>

let
    From = Date.ToText(dateStart, "yyyy-MM-dd HH:mm:ss"),
    To = Date.ToText(dateFinish, "yyyy-MM-dd 23:59:59"),

    url = "http://api-tracker.k50.ru/api/call/ext/" & id & "/" & From & "/" & To & "?apiKey=" & token,
    Source = Json.Document(Web.Contents(url)),
    #"Converted to Table1" = Record.ToTable(Source),
    #"Expanded Value" = Table.ExpandRecordColumn(#"Converted to Table1", "Value", {"id", "start_time", "stop_time", "caller_phone", "called_phone", "duration", "count_call", "is_matching", "sid", "uuid", "user_agent", "label", "source", "source_type", "keyword", "utm_source", "utm_medium", "utm_term", "utm_content", "utm_campaign", "type", "analytics_client_id", "entry_point", "referrer", "entryPoints"}, {"id", "start_time", "stop_time", "caller_phone", "called_phone", "duration", "count_call", "is_matching", "sid", "uuid", "user_agent", "label", "source", "source_type", "keyword", "utm_source", "utm_medium", "utm_term", "utm_content", "utm_campaign", "type", "analytics_client_id", "entry_point", "referrer", "entryPoints"})
in
    #"Expanded Value"
