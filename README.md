WIP

## Typical development activities
### Add a DOJO system
- Edit `src/systems.cairo` 
- Edit `src/dojo/createSystemCalls.ts`
### Add a DOJO component
- Edit `src/components.cairo`
- Edit `src/dojo/contractComponents.ts`
- Edit `src/dojo/createClientComponents.ts`
### Redeploy to Katana
- Restart Katana
- Redeploy the contracts with `make deploy` or `cd contracts && sozo migrate`