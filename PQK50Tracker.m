(id as text, dateStart as date, dateFinish as date, token as text) =>

let
    From = Date.ToText(dateStart, "yyyy-MM-dd HH:mm:ss"),
    To = Date.ToText(dateFinish, "yyyy-MM-dd 23:59:59"),

    url = "http://api-tracker.k50.ru/api/call/ext/" & id & "/" & From & "/" & To & "?apiKey=" & token,
    Source = Json.Document(Web.Contents(url)),
    #"Converted to Table" = Table.FromList(Source, Splitter.SplitByNothing(), null, null, ExtraValues.Error),
    #"Expanded Column1" = Table.ExpandRecordColumn(#"Converted to Table", "Column1", {"id", "start_time", "stop_time", "caller_phone", "called_phone", "duration", "count_call", "is_matching", "sid", "uuid", "utm_source", "utm_medium", "utm_term", "utm_content", "utm_campaign", "type", "analytics_client_id", "entryPoints", "user_agent"}, {"id", "start_time", "stop_time", "caller_phone", "called_phone", "duration", "count_call", "is_matching", "sid", "uuid", "utm_source", "utm_medium", "utm_term", "utm_content", "utm_campaign", "type", "analytics_client_id", "entryPoints", "user_agent"})
in
    #"Expanded Column1"