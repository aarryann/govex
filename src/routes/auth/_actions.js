const Actions = {
  // Get tenant
  getTenantByUrl: async (client, url) => {
    try {
      // client.clearStore();
      const payload = {
        query: queries.tenantByUrl,
        variables: { url }
      };
      const results = await query(client, payload);
      if (results.error) return { error: results.error.message };

      const tenant = results.data.tenantByUrl;
      return { data: tenant.id };
    } catch (e) {
      console.log(`Error#GetTenantByUrl: ${e}`);
      return { error: e.message };
    }
  }
};

export default Actions;
