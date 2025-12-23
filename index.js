export default {
  async fetch(request, env) {
    const url = new URL(request.url);
    
    const headers = {
      'Access-Control-Allow-Origin': '*',
      'Access-Control-Allow-Methods': 'GET, POST, OPTIONS',
      'Access-Control-Allow-Headers': 'Content-Type',
      'Content-Type': 'application/json'
    };

    if (request.method === 'OPTIONS') {
      return new Response(null, { headers });
    }

    // In-memory storage (resets on worker restart)
    // For persistent storage, set up KV later
    const MESSAGES = globalThis.MESSAGES || (globalThis.MESSAGES = {});

    // SEND MESSAGE
    if (url.pathname === '/send' && request.method === 'POST') {
      try {
        const { sender, message, key } = await request.json();
        
        if (!sender || !message || !key) {
          return new Response(JSON.stringify({ error: 'Missing fields' }), { status: 400, headers });
        }

        if (!MESSAGES[key]) {
          MESSAGES[key] = { messages: [], lastId: 0 };
        }

        MESSAGES[key].lastId++;
        MESSAGES[key].messages.push({
          id: MESSAGES[key].lastId,
          sender: sender.substring(0, 20),
          message: message.substring(0, 200),
          time: Date.now()
        });

        // Keep last 50 messages
        if (MESSAGES[key].messages.length > 50) {
          MESSAGES[key].messages.shift();
        }

        return new Response(JSON.stringify({ success: true }), { headers });
      } catch (e) {
        return new Response(JSON.stringify({ error: 'Error' }), { status: 500, headers });
      }
    }

    // GET MESSAGES
    if (url.pathname === '/get') {
      const afterId = parseInt(url.searchParams.get('after')) || 0;
      const key = url.searchParams.get('key') || 'default';

      const data = MESSAGES[key] || { messages: [], lastId: 0 };
      const filtered = data.messages.filter(m => m.id > afterId);

      return new Response(JSON.stringify({ messages: filtered }), { headers });
    }

    // HOME
    return new Response(JSON.stringify({ status: 'online', message: 'Global Chat Server' }), { headers });
  }
};
