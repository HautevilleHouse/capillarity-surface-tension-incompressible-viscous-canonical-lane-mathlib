import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CapillaritySurfaceTensionIncompressibleViscous

structure SurfaceTensionDynamics where
  surfaceTensionCoefficient : Type u
  interfaceEvolution : Type v
  marangoniEffect : Prop
  surfactantTransport : Prop
  marangoniEffectClosed : marangoniEffect
  surfactantTransportClosed : surfactantTransport

structure SurfaceTensionDynamicsEvidence (S : SurfaceTensionDynamics) where
  marangoniEffectClosed : S.marangoniEffect
  surfactantTransportClosed : S.surfactantTransport

def SurfaceTensionDynamicsClosed (S : SurfaceTensionDynamics) : Prop :=
  S.marangoniEffect ∧ S.surfactantTransport

theorem surface_tension_dynamics_closed_from_evidence
    (S : SurfaceTensionDynamics) (E : SurfaceTensionDynamicsEvidence S) :
    SurfaceTensionDynamicsClosed S := by
  exact And.intro E.marangoniEffectClosed E.surfactantTransportClosed

end CapillaritySurfaceTensionIncompressibleViscous
end HautevilleHouse