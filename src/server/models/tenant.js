const getTenantByUrl = async (knex, url) => {
  try {
    const rows = await knex('Tenant as t')
      .innerJoin('TenantAddress as ta', 'ta.tenantId', 't.id')
      .where('ta.url', url)
      .select('t.*');

    const tenant = rows[0];

    return {
      ...tenant,
    };
  } catch (e) {
    throw new Error('Invalid tenant');
  }
};

export default { getTenantByUrl };
