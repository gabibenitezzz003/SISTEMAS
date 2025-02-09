from datetime import datetime
import asyncio
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
import smtplib

class NotificationSystem:
    def __init__(self, db_session):
        self.session = db_session
        self.websocket_clients = set()
        
    async def start(self):
        """Inicia el sistema de notificaciones"""
        while True:
            await self.check_notifications()
            await asyncio.sleep(60)  # Revisar cada minuto
            
    async def check_notifications(self):
        """Revisa y envía notificaciones pendientes"""
        notifications = self.get_pending_notifications()
        
        for notification in notifications:
            await self.send_notification(notification)
            
    async def send_notification(self, notification):
        """Envía una notificación por múltiples canales"""
        # Enviar por WebSocket
        if notification.type == 'urgent':
            await self.broadcast_websocket(notification)
            
        # Enviar por email
        if notification.email_required:
            await self.send_email(notification)
            
        # Enviar por Slack/Teams si está configurado
        if notification.slack_webhook:
            await self.send_slack(notification)
            
    async def broadcast_websocket(self, notification):
        """Envía notificación a todos los clientes conectados"""
        message = {
            'type': 'notification',
            'content': notification.content,
            'level': notification.level,
            'timestamp': datetime.now().isoformat()
        }
        
        for client in self.websocket_clients:
            try:
                await client.send_json(message)
            except Exception:
                self.websocket_clients.remove(client) 