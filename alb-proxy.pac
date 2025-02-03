function FindProxyForURL(url, host) {
  if (shExpMatch(host, "staging-airflow-webserver.*")) {
    return "SOCKS5 localhost:7070";
  }

  if (isInNet(host, "10.100.0.0", "255.255.0.0") || 
      shExpMatch(host, "*.production.dc1.alb*") ||
      host == 'dgx-llm.production.dc2.alb') {
    return "SOCKS5 localhost:1080";
  }
  if (isInNet(host, "10.200.0.0", "255.255.0.0") ||
      isInNet(host, "10.150.0.0", "255.255.0.0") ||
      shExpMatch(host, "*.production.dc2.alb*")) {
    return "SOCKS5 localhost:1082";
  }
  
  if (isInNet(host, "10.1.0.0", "255.255.0.0") ||
      shExpMatch(host, "*.staging.dc1.alb*")) {
    return "SOCKS5 localhost:1081";
  }
  
  return "DIRECT"
}
